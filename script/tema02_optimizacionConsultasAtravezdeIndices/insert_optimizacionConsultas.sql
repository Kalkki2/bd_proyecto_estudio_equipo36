-------------------------------------------------------------------------------------------
-- Ver índices asociados a una tabla
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('citas_medica_new') 
  AND is_primary_key = 0 
  AND is_unique = 0;
-----------------------------------------------------------------------------------------------

-- Elimina el índice IX_columnar_citas_medica_new de la tabla citas_medica_new
DROP INDEX ix_columnar_citas_medica_new ON citas_medica_new; 

-- Índice agrupado (clustered)
CREATE CLUSTERED INDEX ix_columnar_citas_medica_new 
ON citas_medica_new (fecha_citaMedica);

-- Índice columnstore
CREATE COLUMNSTORE INDEX ix_columnar_citas_medica 
ON citas_medica (fecha_citaMedica, id_mascota, id_veterinario);

-- Elimina nuevamente el índice de prueba
DROP INDEX ix_columnar_citas_medica_new ON citas_medica_new; 
-------------------------------------------------------------------------------------------------

-- Duplicación de registros para generar gran volumen de datos (1 millón aprox.)
-- Duplicar mascotas existentes
INSERT INTO mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza)
SELECT nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza
FROM mascota;

-- Duplicar veterinarios existentes con número de licencia nuevo
WITH cte_veterinario AS (
    SELECT nro_licProfesional + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_nro_licProfesional,
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
FROM cte_veterinario
WHERE NOT EXISTS (
    SELECT 1 
    FROM veterinario v 
    WHERE v.nro_licProfesional = cte_veterinario.nuevo_nro_licProfesional
);

-----------------------------------------------------------------------------------------------
-- Creación de la nueva tabla citas_medica_new
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

-- Verificación de registros
SELECT COUNT(*) FROM citas_medica_new;

-----------------------------------------------------------------------------------------------
-- Carga masiva de datos en la tabla citas_medica_new
INSERT INTO citas_medica_new (fecha_citaMedica, observaciones_citas_medica, usuario, motivo_visita, id_mascota, id_veterinario)
SELECT TOP 1000000
  DATEADD(day, CAST(5000 * RAND(CHECKSUM(NEWID())) + 1 AS INT), '2010-01-01') AS fecha_citaMedica,
  'Observación generada' AS observaciones_citas_medica,
  SYSTEM_USER AS usuario,
  'Consulta general' AS motivo_visita,
  m.id_mascota AS id_mascota,
  v.id_veterinario AS id_veterinario
FROM mascota m
JOIN veterinario v ON 1 = 1;

-----------------------------------------------------------------------------------------------
-- Carga masiva en la tabla principal citas_medica
INSERT INTO citas_medica (fecha_citaMedica, observaciones_citas_medica, usuario, motivo_visita, id_mascota, id_veterinario)
SELECT TOP 1000000
  DATEADD(day, CAST(5000 * RAND(CHECKSUM(NEWID())) + 1 AS INT), '2010-01-01') AS fecha_citaMedica,
  'Observación generada' AS observaciones_citas_medica,
  SYSTEM_USER AS usuario,
  'Consulta general' AS motivo_visita,
  m.id_mascota AS id_mascota,
  v.id_veterinario AS id_veterinario
FROM mascota m
JOIN veterinario v ON 1 = 1;

-----------------------------------------------------------------------------------------------
-- Contador total de registros por tabla
SELECT 
    t.name AS tabla, 
    SUM(p.rows) AS row_count
FROM sys.tables AS t
INNER JOIN sys.partitions AS p ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)  -- 0 para heaps y 1 para índices clustered
GROUP BY t.name
ORDER BY row_count DESC;
