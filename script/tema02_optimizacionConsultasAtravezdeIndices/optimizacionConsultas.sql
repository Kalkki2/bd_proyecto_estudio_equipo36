USE gestion_citas_veterinaria;
GO
-------------------------------------------------------------------------------------------
-- BUSQUEDA SIN ÍNDICE (PRUEBAS INICIALES)
-------------------------------------------------------------------------------------------

SELECT * 
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2014-12-31';

SELECT * 
FROM citas_medica_new
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2012-12-31';
GO


-------------------------------------------------------------------------------------------
-- VERIFICAR ÍNDICES (NO PK, NO UNIQUE)
-------------------------------------------------------------------------------------------

SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('citas_medica_new') 
  AND is_primary_key = 0 
  AND is_unique = 0;
GO


-------------------------------------------------------------------------------------------
-- PRUEBA DE EJECUCIÓN SIN ÍNDICES
-------------------------------------------------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2014-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO


-------------------------------------------------------------------------------------------
-- 1) DESHABILITAR Y ELIMINAR RESTRICCIONES (CORREGIDAS)
-------------------------------------------------------------------------------------------

ALTER TABLE citas_medica NOCHECK CONSTRAINT FK_citas_medica_mascota;
ALTER TABLE citas_medica NOCHECK CONSTRAINT FK_citas_medica_veterinario;

ALTER TABLE tratamiento DROP CONSTRAINT FK_tratamiento_citas_medica;

ALTER TABLE citas_medica DROP CONSTRAINT PK_citas_medica_id;
GO


-------------------------------------------------------------------------------------------
-- 2) CREAR ÍNDICE AGRUPADO (CLUSTERED)
-------------------------------------------------------------------------------------------

CREATE CLUSTERED INDEX ix_citas_medica_fecha_citaMedica
ON citas_medica(fecha_citaMedica);
GO

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2014-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-------------------------------------------------------------------------------------------
-- 3) REACTIVAR RESTRICCIONES (CORRECTAS)
-------------------------------------------------------------------------------------------

DROP INDEX ix_citas_medica_fecha_citaMedica ON citas_medica;
 

ALTER TABLE citas_medica 
    WITH CHECK CHECK CONSTRAINT FK_citas_medica_mascota;

ALTER TABLE citas_medica 
    WITH CHECK CHECK CONSTRAINT FK_citas_medica_veterinario;

ALTER TABLE tratamiento 
    ADD CONSTRAINT FK_tratamiento_citas_medica
        FOREIGN KEY(id_citaMedica) REFERENCES citas_medica(id_citaMedica);
GO


-------------------------------------------------------------------------------------------
-- 4) CONSULTA UTILIZANDO EL ÍNDICE AGRUPADO
-------------------------------------------------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2014-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO


-------------------------------------------------------------------------------------------
-- 5) ELIMINAR EL ÍNDICE AGRUPADO
-------------------------------------------------------------------------------------------

DROP INDEX ix_citas_medica_fecha_citaMedica ON citas_medica;
GO


-------------------------------------------------------------------------------------------
-- 6) CREAR ÍNDICE AGRUPADO COMPUESTO
-------------------------------------------------------------------------------------------

ALTER TABLE citas_medica NOCHECK CONSTRAINT FK_citas_medica_mascota;
ALTER TABLE citas_medica NOCHECK CONSTRAINT FK_citas_medica_veterinario;

ALTER TABLE tratamiento DROP CONSTRAINT FK_tratamiento_citas_medica;

ALTER TABLE citas_medica DROP CONSTRAINT PK_citas_medica;
GO

CREATE CLUSTERED INDEX ix_citas_medica_fecha_citaMedica_compuesto
ON citas_medica(id_mascota, id_veterinario, fecha_citaMedica);
GO


-------------------------------------------------------------------------------------------
-- 7) MEDICIÓN DEL ÍNDICE COMPUESTO
-------------------------------------------------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM citas_medica
WHERE fecha_citaMedica BETWEEN '2011-01-01' AND '2013-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO


-------------------------------------------------------------------------------------------
-- 8) ELIMINAR ÍNDICE COMPUESTO Y RESTAURAR TODO
-------------------------------------------------------------------------------------------

DROP INDEX ix_citas_medica_fecha_citaMedica_compuesto ON citas_medica;
GO

ALTER TABLE citas_medica 
    ADD CONSTRAINT PK_citas_medica PRIMARY KEY(id_citaMedica);

ALTER TABLE citas_medica 
    WITH CHECK CHECK CONSTRAINT FK_citas_medica_mascota;

ALTER TABLE citas_medica 
    WITH CHECK CHECK CONSTRAINT FK_citas_medica_veterinario;

ALTER TABLE tratamiento 
    ADD CONSTRAINT FK_tratamiento_citas_medica
        FOREIGN KEY(id_citaMedica) REFERENCES citas_medica(id_citaMedica);
GO
