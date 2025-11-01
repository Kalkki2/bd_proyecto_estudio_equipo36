-- Medir tiempos de ejecución antes de la consulta
-- SET STATISTICS TIME ON;
-- SET STATISTICS PROFILE ON;

-- Búsqueda de registros en un periodo específico (sin índice)
SELECT * 
FROM CitasMedica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2024-12-31';


SELECT * 
FROM CitasMedicaNew
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2024-12-31';
-- Medir tiempos de ejecución después de la consulta
-- SET STATISTICS TIME OFF;
-- SET STATISTICS PROFILE OFF;

-- el siguiente script es para saber si tiene un indice existe
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('CitasMedicaNew') 
  AND is_primary_key = 0 
  AND is_unique = 0; 

--------------------------------------------------------------------------------------------------
-- Ejecutar la consulta sin indices  
-- Activar el plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Repetir la consulta por período sin indices
SELECT *
FROM CitasMedica
WHERE fecha_citaMedica BETWEEN '2024-01-01' AND '2024-12-31';

-- Desactivar el plan de ejecución
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

--------------------------------------------------------------------------------------------------

--------Para crear indices agrupados debimos deshabilitar restricciones.
-- Deshabilitar las restricciones de clave foránea
ALTER TABLE CitasMedica NOCHECK CONSTRAINT FK_CitasMedica_id_mascota;
ALTER TABLE CitasMedica NOCHECK CONSTRAINT FK_CitasMedica_id_veterinario;

--Eliminar la clave foranea FK_tratamiento_id_cita
ALTER TABLE tratamiento DROP CONSTRAINT FK_tratamiento_id_cita;

-- Eliminar la restriccion de clave primaria 
ALTER TABLE CitasMedica DROP CONSTRAINT PK_CitasMedica_id;

--Se creo un indice agrupado con la columna fecha_citaMedica.
CREATE CLUSTERED INDEX IX_CitasMedica_FechaCitaMedica 
ON CitasMedica(fecha_citaMedica);

 --Restaurar las restricciones de clave foránea
ALTER TABLE CitasMedica WITH CHECK CHECK CONSTRAINT FK_CitasMedica_id_mascota;
ALTER TABLE CitasMedica WITH CHECK CHECK CONSTRAINT FK_CitasMedica_id_veterinario;


-- Activar el plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Repetir la consulta por período a traves de indices
SELECT *
FROM CitasMedica
WHERE fecha_citaMedica BETWEEN '2024-01-01' AND '2024-12-31';

-- Desactivar el plan de ejecución
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

--Eliminar indice
DROP INDEX IX_CitasMedica_FechaCitaMedica ON CitasMedica;

--------------------------------------------------------------------------------------------------

/*
Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas 
seleccionadas y repetir la consulta anterior. Registrar el plan de ejecución utilizado 
por el motor y los tiempos de respuesta.
*/

-- Deshabilitar las restricciones de clave foránea
ALTER TABLE CitasMedica NOCHECK CONSTRAINT FK_CitasMedica_id_mascota;
ALTER TABLE CitasMedica NOCHECK CONSTRAINT FK_CitasMedica_id_veterinario;

--Eliminar la clave foranea FK_tratamiento_id_cita
ALTER TABLE tratamiento DROP CONSTRAINT FK_tratamiento_id_cita;

-- Eliminar el índice agrupado actual
ALTER TABLE CitasMedica DROP CONSTRAINT PK_CitasMedica_id;

--Crear el índice agrupado en fecha_citaMedica:
CREATE CLUSTERED INDEX IX_CitasMedica_FechaCitaMedica 
ON CitasMedica(id_mascota, id_veterinario, fecha_citaMedica);

-- Activar el plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

--Ejecutar nuevamente la consulta
SELECT *
FROM CitasMedica
WHERE fecha_citaMedica BETWEEN '2024-01-01' AND '2024-12-31';

-- Desactivar el plan de ejecución
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

DROP INDEX IX_CitasMedica_FechaCitaMedica ON CitasMedica;
