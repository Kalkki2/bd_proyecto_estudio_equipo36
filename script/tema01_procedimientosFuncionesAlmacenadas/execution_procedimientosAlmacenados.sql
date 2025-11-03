USE gestion_citas_veterinaria;
GO
-----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM especie 
SELECT * FROM Raza 
-----------------------------------------------------------------------------------------------------------------------------
-- Inserciones de mascota
EXEC insert_mascota @nombre_mascota = 'Kamelon', @fecha_nacimiento = '2020-01-10', 
@peso_mascota = 5.5, @condicion_mascota = 'Saludable', @id_duenio = 1, @id_raza = 1;

EXEC insert_mascota @nombre_mascota = 'BeiaLuna', @fecha_nacimiento = '2019-03-20',
@peso_mascota = 8.2, @condicion_mascota = 'Vacunada', @id_duenio = 2, @id_raza = 2;

EXEC insert_mascota @nombre_mascota = 'Roberto', @fecha_nacimiento = '2018-08-15',
@peso_mascota = 12.4, @condicion_mascota = 'En tratamiento', @id_duenio = 1, @id_raza = 1;


-----------------------------------------------------------------------------------------------------------------------------
-- Chequeo de inserción 
SELECT * FROM mascota 
WHERE nombre_mascota = 'Kamelon';

SELECT * FROM mascota 
WHERE nombre_mascota = 'BeiaLuna';

SELECT * FROM mascota 
WHERE nombre_mascota = 'Roberto';

SELECT * FROM mascota 
WHERE nombre_mascota LIKE 'RickyMarav%';
-----------------------------------------------------------------------------------------------------------------------------
-- Inserciones de especie

SELECT * FROM especie;

EXEC insertar_especie @nombre = 'Canino';
EXEC insertar_especie @nombre = 'Felino';
EXEC insertar_especie @nombre = 'Ave';

-- Chequeo de las inserciones
SELECT * FROM especie WHERE nombre_especie = 'Canino';
SELECT * FROM especie WHERE nombre_especie = 'Felino';
SELECT * FROM especie WHERE nombre_especie = 'Ave';
-----------------------------------------------------------------------------------------------------------------------------
-- Inserciones de raza
SELECT * FROM raza;

EXEC insertar_raza @nombre_raza = 'Labrador', @id_especie = 51;
EXEC insertar_raza @nombre_raza = 'Persa', @id_especie = 52;
EXEC insertar_raza @nombre_raza = 'Canario', @id_especie = 53;

-- Chequeo de las inserciones
SELECT * FROM raza WHERE nombre_raza = 'Labrador';
SELECT * FROM raza WHERE nombre_raza = 'Persa';
SELECT * FROM raza WHERE nombre_raza = 'Canario';
-----------------------------------------------------------------------------------------------------------------------------
-- Modificaciones

-- Revisamos qué id tiene 'MaxSyle'
SELECT * FROM mascota 
WHERE nombre_mascota = 'Maxsyle';

-- Ejecutamos el procedimiento almacenado para el update
EXEC update_mascota @id_mascota = 364429, @nombre_mascota = 'MaxStyle', @fecha_nacimiento = '2020-01-10', @peso_mascota = 6.0, @condicion_mascota = 'Muy saludable', @id_duenio = 1, @id_raza = 1;

-- Chequeamos la modificación
SELECT * FROM mascota 
WHERE id_mascota = 364429;

--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--

-- Revisamos qué id tiene la especie canino
SELECT * FROM especie WHERE nombre_especie = 'Canino';

-- Ejecutamos el update especie
EXEC update_especie @id = 51, @nombre = 'Reptil';

-- Chequeamos que el update se haya realizado sobre el id encontrado
SELECT * FROM especie WHERE id_especie = 51;

--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--

-- Revisamos qué id tiene la raza canario
SELECT * FROM raza WHERE nombre_raza = 'Labrador';

-- Ejecutamos el update raza
EXEC update_raza @id_raza = 53, @nombre_raza = 'Golden Retriever', @id_especie = 51;

-- Chequeamos que el update se haya realizado sobre el id encontrado
SELECT * FROM raza WHERE id_raza = 53;
-----------------------------------------------------------------------------------------------------------------------------
-- Eliminaciones

-- Chequeamos que las id existan 
SELECT * FROM mascota WHERE id_mascota = 364429;
SELECT * FROM especie WHERE id_especie = 51;
SELECT * FROM raza WHERE id_raza = 53;

-- Ejecutamos los deletes correspondientes
EXEC delete_mascota @id_mascota = 364429;
EXEC delete_especie @id = 51;
EXEC delete_raza @id_raza = 53;

-- Chequeamos que se hayan eliminado correctamente 
SELECT * FROM mascota WHERE id_mascota = 364429;
SELECT * FROM especie WHERE id_especie = 51;
SELECT * FROM raza WHERE id_raza = 53;

GO
