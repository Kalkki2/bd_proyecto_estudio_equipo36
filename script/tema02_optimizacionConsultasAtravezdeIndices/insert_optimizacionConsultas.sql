USE gestion_citas_veterinaria;
GO
-------------------------------------------------------------------------------------------
-- 1. Ver índices asociados a la tabla citas_medica_new
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('citas_medica_new') 
  AND is_primary_key = 0 
  AND is_unique = 0;
GO
-------------------------------------------------------------------------------------------

-- 2. Eliminar índice CLUSTERED si existe
IF EXISTS (
    SELECT 1 
    FROM sys.indexes 
    WHERE name = 'ix_columnar_citas_medica_new'
      AND object_id = OBJECT_ID('citas_medica_new')
)
DROP INDEX ix_columnar_citas_medica_new ON citas_medica_new;
GO

-- 3. Crear índice CLUSTERED en citas_medica_new
CREATE CLUSTERED INDEX ix_columnar_citas_medica_new 
ON citas_medica_new (fecha_citaMedica);
GO

-- 4. Crear índice columnstore en tabla principal
-- (si existe, eliminarlo antes)
IF EXISTS (
    SELECT 1 FROM sys.indexes 
    WHERE name = 'ix_columnar_citas_medica'
      AND object_id = OBJECT_ID('citas_medica')
)
DROP INDEX ix_columnar_citas_medica ON citas_medica;
GO

CREATE COLUMNSTORE INDEX ix_columnar_citas_medica 
ON citas_medica (fecha_citaMedica, id_mascota, id_veterinario);
GO

-------------------------------------------------------------------------------------------
-- 5. Duplicación de registros en tablas base
-- DUPLICAR MASCOTAS
INSERT INTO mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza)
SELECT nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza
FROM mascota;
GO

-- DUPLICAR VETERINARIOS con nuevo nro de licencia
WITH cte_veterinario AS (
    SELECT 
        nro_licProfesional + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_nro_licProfesional,
        nombre_profesional,
        hora_entrada,
        hora_salida,
        id_especialidad
    FROM veterinario
)
INSERT INTO veterinario (nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
SELECT nuevo_nro_licProfesional,
       nombre_profesional,
       hora_entrada,
       hora_salida,
       id_especialidad
FROM cte_veterinario v
WHERE NOT EXISTS (
    SELECT 1 FROM veterinario x 
    WHERE x.nro_licProfesional = v.nuevo_nro_licProfesional
);
GO

-------------------------------------------------------------------------------------------
-- 6. Crear tabla citas_medica_new
IF OBJECT_ID('citas_medica_new') IS NULL
CREATE TABLE citas_medica_new (
  id_citas_medica INT IDENTITY(1,1),
  fecha_citaMedica DATE NOT NULL DEFAULT GETDATE(),
  observaciones_citas_medica VARCHAR(70) NOT NULL,
  usuario VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  motivo_visita VARCHAR(50) NOT NULL,
  id_mascota INT NOT NULL,
  id_veterinario INT NOT NULL,
  CONSTRAINT pk_citas_medica_new_id PRIMARY KEY (id_citas_medica),
  CONSTRAINT fk_citas_medica_new_id_mascota FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota),
  CONSTRAINT fk_citas_medica_new_id_veterinario FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario)
);
GO
-------------------------------------------------------------------------------------------
-- 7. Contador de verificación inicial
SELECT COUNT(*) AS registros_iniciales FROM citas_medica_new;
GO

-------------------------------------------------------------------------------------------
-- 8. Carga masiva de datos en la tabla citas_medica_new
DECLARE @i INT = 1;

WHILE @i <= 99
BEGIN
INSERT INTO citas_medica_new (fecha_citaMedica, observaciones_citas_medica, usuario, motivo_visita, id_mascota, id_veterinario)
SELECT TOP 1000000
    DATEADD(day, CAST(5000 * RAND(CHECKSUM(NEWID())) + 1 AS INT), '2010-01-01'),
    'Observación generada',
    SYSTEM_USER,
    'Consulta general',
    m.id_mascota,
    v.id_veterinario
FROM mascota m
CROSS JOIN veterinario v;

    PRINT 'Inserción número: ' + CAST(@i AS VARCHAR(10));

    SET @i = @i + 1;
END
GO

-------------------------------------------------------------------------------------------
-- 9. Carga masiva en la tabla principal citas_medica
DECLARE @i INT = 1;

WHILE @i <= 99
BEGIN
    INSERT INTO citas_medica (
        fecha_citaMedica,
        observaciones_citaMedica,
        usuario,
        motivo_visita,
        id_mascota,
        id_veterinario
    )
    SELECT TOP 1000000
        DATEADD(day, CAST(5000 * RAND(CHECKSUM(NEWID())) + 1 AS INT), '2010-01-01'),
        'Observación generada',
        SYSTEM_USER,
        'Consulta general',
        m.id_mascota,
        v.id_veterinario
    FROM mascota m
    CROSS JOIN veterinario v;

    PRINT 'Inserción número: ' + CAST(@i AS VARCHAR(10));

    SET @i = @i + 1;
END
GO


-------------------------------------------------------------------------------------------
-- 10. Contador total de registros por tabla
SELECT 
    t.name AS tabla, 
    SUM(p.rows) AS row_count
FROM sys.tables AS t
INNER JOIN sys.partitions AS p ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)
GROUP BY t.name
ORDER BY row_count DESC;
GO
