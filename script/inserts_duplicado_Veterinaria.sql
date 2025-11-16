--USE gestion_citas_veterinaria;
-- Duplicar los datos

INSERT INTO especie (nombre_especie) SELECT nombre_especie FROM especie;

INSERT INTO raza (nombre_raza, id_especie) SELECT nombre_raza, id_especie FROM raza;

--ROW_NUMBER devuelve el número secuencial de una fila dentro de una partición de un conjunto de resultados
--OVER : Espesifica que es un funcion de ventana

-- With Tabla temporal donde colocas las variaciones que queres efectuar sobre la tabla duenio
-- El from del Insert va ser sobre CTE (nomb_generico) y el ultimo modulo ni idea

--inicio de la funcion duplicar duenio
WITH CTE AS (
    SELECT  nombre_duenio,
            apellido_duenio, 
            CAST(dni_duenio AS INT) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_dni,
            telefono_duenio + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_telefono,
            CONCAT('correo', ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), '@ejemplo.com') AS nuevo_email,
            direccion_duenio 
    FROM duenio
)
INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio)
SELECT  nombre_duenio,
        apellido_duenio, 
        nuevo_dni, 
        nuevo_telefono, 
        nuevo_email, 
        direccion_duenio 
FROM CTE
WHERE NOT EXISTS (
    SELECT 1 
    FROM duenio d 
    WHERE d.telefono_duenio = CTE.nuevo_telefono
       OR d.dni_duenio = CTE.nuevo_dni
);
--fin de la funcion duplicar duenio

INSERT INTO especialidad (nombre_especialidad) SELECT nombre_especialidad FROM especialidad

INSERT INTO laboratorio (nombre_lab) SELECT nombre_lab FROM laboratorio;

--Ejecutar varias veces para tener un lote grande de mascotas 
INSERT INTO Mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza)
SELECT nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza
FROM Mascota;

INSERT INTO Medicamento (nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
SELECT nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio
FROM Medicamento;

--INICIO DE LA FUNCION DUPLICAR VET 
-- Ejecutar varias veces para poder llegar al millon de insersiones en cita medica 


-- Creacion de datos tratamiento_medicamento

-- Crear una tabla temporal para almacenar los pares de id_medicamento e id_tratamiento
CREATE TABLE #TemptratamientoMedicamento (
    id_medicamento INT,
    id_tratamiento INT
);

-- Insertar combinaciones de id_medicamento e id_tratamiento
INSERT INTO #TemptratamientoMedicamento (id_medicamento, id_tratamiento)
SELECT m.id_medicamento, t.id_tratamiento
FROM Medicamento m
CROSS JOIN tratamiento t;

-- Insertar en la tabla tratamiento_medicamento asegurando que no haya duplicados
INSERT INTO tratamiento_medicamento (id_medicamento, id_tratamiento)
SELECT id_medicamento, id_tratamiento
FROM #TemptratamientoMedicamento
WHERE NOT EXISTS (
    SELECT 1 
    FROM tratamiento_medicamento tm 
    WHERE tm.id_medicamento = #TemptratamientoMedicamento.id_medicamento
      AND tm.id_tratamiento = #TemptratamientoMedicamento.id_tratamiento
);

-- Eliminar la tabla temporal
DROP TABLE #TemptratamientoMedicamento;


-- Contador de registro total
SELECT 
t.name
 AS tabla, SUM(p.rows) AS row_count
FROM sys.tables AS t
INNER JOIN sys.partitions AS p ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)  -- 0 para heaps (tablas sin índice clustered) y 1 para índices clustered
GROUP BY 
t.name

ORDER BY row_count DESC; 
