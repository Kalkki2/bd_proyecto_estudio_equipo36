USE gestion_citas_veterinaria;

--Se cambia el tipo de dato de la columna ahora soporta texto muy largo, necesario para almacenar un JSON completo.
ALTER TABLE duenio
ALTER COLUMN direccion_duenio NVARCHAR(MAX);

-- Se inserta un registro primeros 5 son valores normales (strings, número).
-- último valor es un JSON completo, almacenado como texto:
-- Se usa N'...' para indicar que es Unicode, necesario cuando almacenas JSON en NVARCHAR.
INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio)
VALUES ('Rita', 'Morales', '44983120', 3794536281, 'moraless98@gmail.com',N'{"calle": "San Martin 234", "ciudad": "Corrientes"}');



--El siguiente script toma un objeto JSON, extrae cada uno de sus campos usando JSON_VALUE, y los inserta 
--en las columnas correspondientes de la tabla dueno, asignando cada propiedad del JSON a su columna específica.

-- Declaramos una variable para almacenar el JSON completo
DECLARE @un_duenio NVARCHAR(MAX);

-- Cargamos un objeto JSON con todos los datos del dueño
SET @un_duenio = N'{
    "duenio": {
        "nombre": "Franco",
        "apellido": "Alegre",
        "dni": "45666239",
        "telefono": "3796742323",
        "email": "elfradnd2@gmail.com",
        "direccion": {"calle": "Catamarca 842", "ciudad": "Corrientes"}
          
     }
}';

-- Insertamos los datos en la tabla "dueno" usando valores sacados del JSON
--Con JSON_VALUE extraés el valor
--Con JSON_QUERY se devuelve un objeto JSON completo,
INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio)
SELECT 
    JSON_VALUE(@un_duenio, '$.duenio.nombre'),  
    JSON_VALUE(@un_duenio, '$.duenio.apellido'),
    JSON_VALUE(@un_duenio, '$.duenio.dni'),
    JSON_VALUE(@un_duenio, '$.duenio.telefono'),
    JSON_VALUE(@un_duenio, '$.duenio.email'),
    JSON_QUERY(@un_duenio, '$.duenio.direccion');  -- Objeto JSON completo



--Visualizar el contenido JSON que está guardado en una columna
SELECT direccion_duenio
FROM duenio
WHERE ISJSON(direccion_duenio) = 1 --Se usa ISJSON() para validar que la columna contiene JSON correcto
FOR JSON AUTO;

SELECT *
FROM duenio
WHERE ISJSON(direccion_duenio) = 1 


-- Se usa JSON_VALUE para extraer datos específicos del JSON almacenado
SELECT 
    nombre_duenio ,
    apellido_duenio ,
    JSON_VALUE(direccion_duenio, '$.calle') AS calle,
    JSON_VALUE(direccion_duenio, '$.ciudad') AS ciudad
FROM duenio
WHERE ISJSON(direccion_duenio) = 1
FOR JSON AUTO;



SELECT 
    nombre_duenio ,
    apellido_duenio ,
    JSON_VALUE(direccion_duenio, '$.calle') AS calle,
    JSON_VALUE(direccion_duenio, '$.ciudad') AS ciudad
FROM duenio
WHERE ISJSON(direccion_duenio) = 1
























use gestion_veterinaria

--Se cambia el tipo de dato de la columna ahora soporta texto muy largo, necesario para almacenar un JSON completo.
ALTER TABLE duenio
ALTER COLUMN direccion_duenio NVARCHAR(MAX);

-- Se inserta un registro primeros 5 son valores normales (strings, número).
-- último valor es un JSON completo, almacenado como texto:
-- Se usa N'...' para indicar que es Unicode, necesario cuando almacenas JSON en NVARCHAR.
INSERT INTO dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
VALUES ('Rita', 'Morales', '44983120', 3794536281, 'moraless98@gmail.com',N'{"calle": "San Martin 234", "ciudad": "Corrientes"}');



--El siguiente script toma un objeto JSON, extrae cada uno de sus campos usando JSON_VALUE, y los inserta 
--en las columnas correspondientes de la tabla dueno, asignando cada propiedad del JSON a su columna específica.

-- Declaramos una variable para almacenar el JSON completo
DECLARE @un_duenio NVARCHAR(MAX);

-- Cargamos un objeto JSON con todos los datos del dueño
SET @un_duenio = N'{
    "duenio": {
        "nombre": "Franco",
        "apellido": "Alegre",
        "dni": "45666239",
        "telefono": "3796742323",
        "email": "elfradnd2@gmail.com",
        "direccion": {"calle": "Catamarca 842", "ciudad": "Corrientes"}
          
     }
}';

-- Insertamos los datos en la tabla "dueno" usando valores sacados del JSON
--Con JSON_VALUE extraés el valor
--Con JSON_QUERY se devuelve un objeto JSON completo,
INSERT INTO dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
SELECT 
    JSON_VALUE(@un_duenio, '$.duenio.nombre'),  
    JSON_VALUE(@un_duenio, '$.duenio.apellido'),
    JSON_VALUE(@un_duenio, '$.duenio.dni'),
    JSON_VALUE(@un_duenio, '$.duenio.telefono'),
    JSON_VALUE(@un_duenio, '$.duenio.email'),
    JSON_QUERY(@un_duenio, '$.duenio.direccion');  -- Objeto JSON completo



--Visualizar el contenido JSON que está guardado en una columna
SELECT direccion_dueno 
FROM dueno
WHERE ISJSON(direccion_dueno) = 1 AND id_dueno >= 2014 --Se usa ISJSON() para alidar que la columna contiene JSON correcto
FOR JSON AUTO;



SELECT *
FROM dueno
WHERE ISJSON(direccion_dueno) = 1 AND id_dueno >= 2014
FOR JSON AUTO;



-- Se usa JSON_VALUE para extraer datos específicos del JSON almacenado
SELECT 
    nombre_dueno ,
    apellido_dueno ,
    JSON_VALUE(direccion_dueno, '$.calle') AS calle,
    JSON_VALUE(direccion_dueno, '$.ciudad') AS ciudad
FROM dueno
WHERE ISJSON(direccion_dueno) = 1
FOR JSON AUTO;


SELECT 
    id_dueno id_duenio,
    nombre_dueno  nombre_duenio,
    apellido_dueno apellido_duenio,
    JSON_VALUE(direccion_dueno, '$.calle') AS calle,
    JSON_VALUE(direccion_dueno, '$.ciudad') AS ciudad
FROM dueno
WHERE ISJSON(direccion_dueno) = 1 AND id_dueno >= 2014;;



SELECT 
    id_dueno ,
    nombre_dueno ,
    apellido_dueno ,
    JSON_VALUE(direccion_dueno, '$.calle') AS calle,
    JSON_VALUE(direccion_dueno, '$.ciudad') AS ciudad
FROM dueno
WHERE ISJSON(direccion_dueno) = 1 AND id_dueno >= 2014;;



SELECT 
    id_dueno ,
    nombre_dueno ,
    apellido_dueno ,
    JSON_VALUE(direccion_dueno, '$.calle') AS calle,
    JSON_VALUE(direccion_dueno, '$.ciudad') AS ciudad
FROM dueno
WHERE ISJSON(direccion_dueno) = 1 AND id_dueno >= 2014;;
