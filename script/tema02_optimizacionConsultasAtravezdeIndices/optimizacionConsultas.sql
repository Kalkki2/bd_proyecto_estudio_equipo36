USE gestion_citas_veterinaria;
-------------------------------------------------------------------------------------------
-- Medir tiempos de ejecución antes de la consulta
-- SET STATISTICS TIME ON;
-- SET STATISTICS PROFILE ON;

-- Búsqueda de registros en un periodo específico (sin índice)
SELECT * 
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2024-12-31';

SELECT * 
FROM citas_medica_new
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2024-12-31';

-- Medir tiempos de ejecución después de la consulta
-- SET STATISTICS TIME OFF;
-- SET STATISTICS PROFILE OFF;

-------------------------------------------------------------------------------------------
-- Verificar si existe un índice en la tabla
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('citas_medica_new') 
  AND is_primary_key = 0 
  AND is_unique = 0; 
-------------------------------------------------------------------------------------------

-- Ejecutar la consulta sin índices  
-- Activar el plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Repetir la consulta por período sin índices
SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2025-01-01' AND '2025-12-31';

-- Desactivar el plan de ejecución
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-------------------------------------------------------------------------------------------
-- Para crear índices agrupados debemos deshabilitar restricciones

-- Deshabilitar las restricciones de clave foránea
ALTER TABLE citas_medica NOCHECK CONSTRAINT fk_citas_medica_id_mascota;
ALTER TABLE citas_medica NOCHECK CONSTRAINT fk_citas_medica_id_veterinario;

-- Eliminar la clave foránea fk_tratamiento_id_cita
ALTER TABLE tratamiento DROP CONSTRAINT fk_tratamiento_id_cita;

-- Eliminar la restricción de clave primaria 
ALTER TABLE citas_medica DROP CONSTRAINT pk_citas_medica_id;

-- Crear un índice agrupado (clustered) sobre la columna fecha_citaMedica
CREATE CLUSTERED INDEX ix_citas_medica_fecha_citaMedica 
ON citas_medica(fecha_citaMedica);

-- Restaurar las restricciones de clave foránea
ALTER TABLE citas_medica WITH CHECK CHECK CONSTRAINT fk_citas_medica_id_mascota;
ALTER TABLE citas_medica WITH CHECK CHECK CONSTRAINT fk_citas_medica_id_veterinario;

-- Activar el plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Repetir la consulta por período con índice
SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2024-01-01' AND '2024-12-31';

-- Desactivar el plan de ejecución
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- Eliminar índice
DROP INDEX ix_citas_medica_fecha_citaMedica ON citas_medica;

-------------------------------------------------------------------------------------------
/*
Definir otro índice agrupado sobre la columna fecha_citaMedica,
pero que además incluya las columnas seleccionadas y repetir la consulta anterior.
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
*/

-- Deshabilitar las restricciones de clave foránea
ALTER TABLE citas_medica NOCHECK CONSTRAINT fk_citas_medica_id_mascota;
ALTER TABLE citas_medica NOCHECK CONSTRAINT fk_citas_medica_id_veterinario;

-- Eliminar la clave foránea fk_tratamiento_id_cita
ALTER TABLE tratamiento DROP CONSTRAINT fk_tratamiento_id_cita;

-- Eliminar la restricción de clave primaria
ALTER TABLE citas_medica DROP CONSTRAINT pk_citas_medica_id;

-- Crear un índice agrupado compuesto
CREATE CLUSTERED INDEX ix_citas_medica_fecha_citaMedica_compuesto 
ON citas_medica(id_mascota, id_veterinario, fecha_citaMedica);

-- Activar el plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Ejecutar nuevamente la consulta
SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2024-01-01' AND '2024-12-31';

-- Desactivar el plan de ejecución
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- Eliminar índice compuesto
DROP INDEX ix_citas_medica_fecha_citaMedica_compuesto ON citas_medica;
