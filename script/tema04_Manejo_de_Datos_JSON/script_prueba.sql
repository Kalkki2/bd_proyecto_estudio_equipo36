USE gestion_citas_veterinaria;

--Se cambia el tipo de dato de la columna ahora soporta texto muy largo, necesario para almacenar un JSON completo.
ALTER TABLE mascota 
ADD info_extra NVARCHAR(MAX);


--Inserta un JSON, almacenado como texto:
UPDATE mascota
SET info_extra = '{
  "vacunas": ["rabia", "parvovirus"],
  "color": "marron",
  "chip": true
}'
WHERE id_mascota = 1;

UPDATE mascota
SET info_extra = '{
  "color": "marrón",
  "vacunas": ["rabia", "moquillo"],
  "chip": true,
  "alergias": null
}'
WHERE id_mascota = 2;

UPDATE mascota
SET info_extra = '{
  "color": "blanco y negro",
  "vacunas": ["parvovirus"],
  "chip": false
}'
WHERE id_mascota = 3;


--Prueba JSON_VALUE (para valores simples)
SELECT
  id_mascota,
  nombre_mascota,
  JSON_VALUE(info_extra, '$.color') AS color,
  JSON_VALUE(info_extra, '$.chip') AS chip
FROM mascota
WHERE info_extra IS NOT NULL;


--Prueba JSON_QUERY (para objetos o arrays)
SELECT 
  id_mascota,
  nombre_mascota,
  JSON_QUERY(info_extra, '$.vacunas') AS vacunas
FROM mascota
WHERE info_extra IS NOT NULL;

--Prueba JASON_VALUE Y JSON_QUERY
SELECT 
  nombre_mascota,
  JSON_VALUE(info_extra, '$.color') AS color,
  JSON_QUERY(info_extra, '$.vacunas') AS vacunas
FROM mascota
WHERE id_mascota = 1;


--Probar OPENJSON (convertir array a filas)
SELECT 
  id_mascota,
  nombre_mascota,
  JSON_QUERY(info_extra, '$.vacunas') AS vacunas
FROM mascota
WHERE info_extra IS NOT NULL;

