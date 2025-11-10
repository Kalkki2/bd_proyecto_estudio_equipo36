# TEMA 4: Manejo de Datos de Tipo JSON en SQL Server
## 1. Introducción
El manejo de datos en formato **JSON (JavaScript Object Notation)** ha cobrado gran relevancia en los sistemas actuales debido a su flexibilidad, legibilidad y facilidad para intercambiar información entre aplicaciones.
En SQL Server, aunque no existe un tipo de dato nativo JSON, se permite trabajar con él utilizando el tipo NVARCHAR(MAX), junto con un conjunto de **funciones JSON integradas** que facilitan su almacenamiento, consulta y modificación.
El uso de JSON es especialmente útil en escenarios donde los datos presentan estructuras variables, o cuando es necesario integrar información desde servicios web, APIs o sistemas externos.

## 2. Creación de una tabla que almacene datos tipo JSON
En SQL Server, una tabla puede almacenar documentos JSON completos dentro de un campo de tipo NVARCHAR(MAX).
Esto permite conservar la estructura jerárquica del JSON sin necesidad de definir previamente todas las columnas.


**Ejemplo:**  

**CREATE TABLE producto_json (  
      id_producto INT IDENTITY(1,1) PRIMARY KEY,  
      datos NVARCHAR(MAX)  
);**

En este ejemplo, la columna datos contendrá la información estructurada en formato JSON.
También es posible **validar** que los datos insertados sean JSON válidos mediante una restricción CHECK:  

**ALTER TABLE producto_json  
ADD CONSTRAINT chk_datos_json_validos  
CHECK (ISJSON(datos) > 0);**  

La función ISJSON() devuelve 1 si el contenido es un JSON válido, ayudando a mantener la integridad de los datos.  

## 3. Inserciones a la tabla JSON a partir de columnas no estructuradas
En muchas situaciones, la información proviene de **tablas relacionales** y es necesario transformarla a formato JSON.
SQL Server incluye funciones que permiten **generar JSON** directamente desde consultas.  

**Ejemplo:**

Supongamos que tenemos una tabla tradicional llamada producto:

**CREATE TABLE producto (  
      id INT,  
      nombre VARCHAR(100),  
      precio DECIMAL(10,2),  
      stock INT  
);** 

**INSERT INTO producto VALUES  
(1, 'Collar para perro', 1200.00, 25),  
(2, 'Comedero doble', 1800.00, 15);**  

Podemos convertir su contenido a formato JSON e insertarlo en producto_json:

**INSERT INTO producto_json (datos)  
SELECT (SELECT nombre, precio, stock FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)  
FROM producto  
WHERE id = 1;**  

El resultado en la columna datos será algo como:  
**{"nombre":"Collar para perro","precio":1200.00,"stock":25}**  


De esta forma, una tabla relacional puede alimentar una tabla con estructura JSON, lo que facilita la interoperabilidad entre modelos de datos distintos.


## 4. Operaciones y funciones para el manejo de datos JSON
SQL Server ofrece varias **funciones nativas** para manipular y consultar los datos almacenados en formato JSON.
Las más utilizadas son:
| Función         | Descripción                                                 |
| --------------- | ----------------------------------------------------------- |
| `ISJSON()`      | Verifica si una cadena es un JSON válido.                   |
| `JSON_VALUE()`  | Extrae un valor escalar (texto o número) dentro de un JSON. |
| `JSON_QUERY()`  | Extrae un objeto o arreglo JSON completo.                   |
| `JSON_MODIFY()` | Modifica o agrega elementos dentro del JSON.                |
| `OPENJSON()`    | Descompone un JSON en formato tabular (filas y columnas).   |

**Ejemplos prácticos:**  
-- Extraer campos específicos  
**SELECT  
    JSON_VALUE(datos, '$.nombre') AS nombre,  
    JSON_VALUE(datos, '$.precio') AS precio  
FROM producto_json;**  

-- Extraer un objeto completo  
**SELECT JSON_QUERY(datos, '$') AS objeto_completo   
FROM producto_json;**

-- Modificar un valor dentro del JSON  
**UPDATE producto_json  
SET datos = JSON_MODIFY(datos, '$.stock', 20)  
WHERE id_producto = 1;**  

-- Agregar una nueva propiedad  
**UPDATE producto_json  
SET datos = JSON_MODIFY(datos, '$.categoria', 'Accesorios')  
WHERE id_producto = 1;**  

-- Convertir JSON a tabla  
**SELECT *  
FROM OPENJSON((SELECT datos FROM producto_json WHERE id_producto = 1))  
WITH (  
    nombre NVARCHAR(100),  
    precio DECIMAL(10,2),  
    stock INT  
);**

Estas funciones permiten consultar y modificar datos JSON **sin necesidad de desnormalizar la base** ni alterar su estructura.

## 5. Aproximación a la optimización de consultas con datos JSON
Aunque el uso de JSON otorga flexibilidad, puede impactar el rendimiento si se consulta frecuentemente información interna del documento.
Por eso, es importante aplicar algunas prácticas de optimización:

**a) Extraer los valores más consultados** en columnas calculadas o indexadas:

**ALTER TABLE producto_json
ADD nombre AS JSON_VALUE(datos, '$.nombre') PERSISTED;** 

**CREATE INDEX idx_nombre_json ON producto_json(nombre);**

Esto permite realizar búsquedas rápidas sin tener que analizar todo el texto JSON.

**b) Validar los datos al momento de la inserción** con ISJSON() para evitar errores posteriores.

**c) Usar OPENJSON() solo cuando sea necesario** convertir los datos a formato tabular, ya que esta operación es más costosa.

**d) Combinar consultas relacionales y JSON** para mantener equilibrio entre flexibilidad y rendimiento:

**SELECT id_producto, JSON_VALUE(datos, '$.nombre') AS nombre
FROM producto_json
WHERE JSON_VALUE(datos, '$.precio') > 1000;**

## 6. En conclusión
El manejo de datos JSON en SQL Server permite combinar la **estructura relacional tradicional** con la **flexibilidad de los documentos semiestructurados.**
Gracias a sus funciones nativas **(JSON_VALUE, JSON_QUERY, JSON_MODIFY, OPENJSON)**, es posible almacenar, consultar y modificar información de manera eficiente.
Al aplicar buenas prácticas de validación e indexación, el uso de JSON puede ser una excelente solución para escenarios de integración, configuración dinámica o intercambio de datos entre sistemas.

