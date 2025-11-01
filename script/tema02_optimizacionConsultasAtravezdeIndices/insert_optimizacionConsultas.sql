
--Carga de datos esta en tema04_indicesColumnares/inserts_indicesColumnares.sql

-------------------------------------------------------------------------------------------
-- Ver Indices asociados a una tabla
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('CitasMedicaNew') 
  AND is_primary_key = 0 
  AND is_unique = 0;
-----------------------------------------------------------------------------------------------
--Elimina el indice IDX_gastoNEW de la tabla gastoNew
DROP INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew; 

--INDICE AGRUPADO CLUESTER

CREATE CLUSTERED INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew (fecha_citaMedica);

--INDICE AGRUPADO CLUESTER
CREATE COLUMNSTORE INDEX IX_Columnar_CitasMedicaNew ON CitasMedica (fecha_citaMedica, id_mascota, id_veterinario);

--Elimina el indice IDX_gastoNEW de la tabla gastoNew
DROP INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew; 
-------------------------------------------------------------------------------------------------

-- INSERT 1 millon de datos Cita medica tabla de mayor ocurrencia 
-- Duplicar Mascotas ya creadas 

--Ejecutar varias veces para tener un lote grande de mascotas 
INSERT INTO Mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza)
SELECT nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza
FROM Mascota;

-- Ejecutar varias veces para poder llegar al millon de insersiones en cita medica 
WITH CTE AS (
    SELECT  nro_licProfesional + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_nro_licProfesional,
            nombre_profesional,
            hora_entrada,
            hora_salida,
            id_especialidad
    FROM Veterinario
)
INSERT INTO Veterinario (nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
SELECT  nuevo_nro_licProfesional,
        nombre_profesional,
        hora_entrada,
        hora_salida,
        id_especialidad
FROM CTE
WHERE NOT EXISTS (
    SELECT 1 
    FROM Veterinario v 
    WHERE v.nro_licProfesional = CTE.nuevo_nro_licProfesional
);

--FIN DE LA FUNCION DUPLICAR VET










-- Creamos una nueva tabla
CREATE TABLE CitasMedicaNew
(
  id_citaMedica INT IDENTITY(1,1),
  fecha_citaMedica DATE NOT NULL DEFAULT GETDATE(),
  observaciones_citaMedica VARCHAR(70) NOT NULL,
  usuario VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  motivo_visita VARCHAR(50) NOT NULL,
  id_mascota INT NOT NULL,
  id_veterinario INT NOT NULL,
  CONSTRAINT PK_CitasMedicaNew_id PRIMARY KEY (id_citaMedica),
  CONSTRAINT FK_CitasMedicaNew_id_mascota FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
  CONSTRAINT FK_CitasMedicaNew_id_veterinario FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
);


select count(*) from CitasMedicaNew





-- Carga masiva de datos en la tabla CitaMedicaNew
INSERT INTO CitasMedicaNew (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
SELECT TOP 1000000
  DATEADD(day, CAST(5000 * RAND(CHECKSUM(NEWID())) + 1 AS INT), '2010-01-01') AS fecha_citaMedica,
  'Observación generada' AS observaciones_citaMedica,
  SYSTEM_USER AS usuario,
  'Consulta general' AS motivo_visita,
  m.id_mascota AS id_mascota,  -- Selección de id_mascota válidos de la tabla Mascota
  v.id_veterinario AS id_veterinario  -- Selección de id_veterinario válidos de la tabla Veterinario
FROM Mascota m
JOIN Veterinario v ON 1 = 1;  -- Este JOIN asegura que tomas todos los id_veterinario disponibles



-- Carga masiva de datos en la tabla CitaMedica
INSERT INTO CitasMedica (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
SELECT TOP 1000000
  DATEADD(day, CAST(5000 * RAND(CHECKSUM(NEWID())) + 1 AS INT), '2010-01-01') AS fecha_citaMedica,
  'Observación generada' AS observaciones_citaMedica,
  SYSTEM_USER AS usuario,
  'Consulta general' AS motivo_visita,
  m.id_mascota AS id_mascota,  -- Selección de id_mascota válidos de la tabla Mascota
  v.id_veterinario AS id_veterinario  -- Selección de id_veterinario válidos de la tabla Veterinario
FROM Mascota m
JOIN Veterinario v ON 1 = 1;  -- Este JOIN asegura que tomas todos los id_veterinario disponibles


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
