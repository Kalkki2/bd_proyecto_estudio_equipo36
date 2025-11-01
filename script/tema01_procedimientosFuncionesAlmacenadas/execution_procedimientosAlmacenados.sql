USE gestion_veterinaria;
GO
-----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Especie 
SELECT * FROM Raza 
-----------------------------------------------------------------------------------------------------------------------------
-- Inserciones de Mascota
EXEC InsertMascota @nombre_mascota = 'Kamelon', @fecha_nacimiento = '2020-01-10', @peso_mascota = 5.5, @condicion_mascota = 'Saludable', @id_dueno = 1, @id_raza = 1;

EXEC InsertMascota @nombre_mascota = 'BeiaLuna', @fecha_nacimiento = '2019-03-20', @peso_mascota = 8.2, @condicion_mascota = 'Vacunada', @id_dueno = 2, @id_raza = 2;

EXEC InsertMascota @nombre_mascota = 'Roberto', @fecha_nacimiento = '2018-08-15', @peso_mascota = 12.4, @condicion_mascota = 'En tratamiento', @id_dueno = 1, @id_raza = 1;
-----------------------------------------------------------------------------------------------------------------------------
-- Chequeo de insercion 
SELECT * FROM Mascota 
WHERE nombre_mascota = 'Maxsyle'  --Busco de esta forma porque el espacio de destinado al campo es chico por ahi me trunca los nombres

SELECT * FROM Mascota 
WHERE nombre_mascota = 'BellaVista'

SELECT * FROM Mascota 
WHERE nombre_mascota = 'RickyMarav'

SELECT * FROM Mascota 
WHERE nombre_mascota like 'RickyMarav%'
-----------------------------------------------------------------------------------------------------------------------------
--Inseciones de Especie

SELECT * FROM Especie 

EXEC InsertarEspecie @nombre = 'Canino';
EXEC InsertarEspecie @nombre = 'Felino';
EXEC InsertarEspecie @nombre = 'Ave';

--Chequeo de las inserciones
SELECT * FROM Especie WHERE nombre_especie = 'Canino'
SELECT * FROM Especie WHERE nombre_especie = 'Felino'
SELECT * FROM Especie WHERE nombre_especie = 'Ave'
-----------------------------------------------------------------------------------------------------------------------------
--Inseciones de Raza
SELECT * FROM Raza 

EXEC InsertarRaza @nombre_raza = 'Labrador', @id_especie = 51;
EXEC InsertarRaza @nombre_raza = 'Persa', @id_especie = 52;
EXEC InsertarRaza @nombre_raza = 'Canario', @id_especie = 53;

--Chequeo de las inserciones
SELECT * FROM Raza WHERE nombre_raza = 'Labrador'
SELECT * FROM Raza WHERE nombre_raza = 'Persa'
SELECT * FROM Raza WHERE nombre_raza = 'Canario'

-----------------------------------------------------------------------------------------------------------------------------
-- Modificaciones

--revisamos que id tiene 'MaxSyle'
SELECT * FROM Mascota 
WHERE nombre_mascota = 'Maxsyle'

--Ejecutamos el procedimiento almacenado para el update
EXEC UpdateMascota @id_mascota = 364429, @nombre_mascota = 'MaxStyle', @fecha_nacimiento = '2020-01-10', @peso_mascota = 6.0, @condicion_mascota = 'Muy saludable', @id_dueno = 1, @id_raza = 1;

--Chequeamos la modificacion
SELECT * FROM Mascota 
WHERE id_mascota = 364429

--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--

--revisamos que id tiene la especie canino
SELECT * FROM Especie WHERE nombre_especie = 'Canino'

--ejecutamos el update Especie
EXEC UpdateEspecie @id = 51, @nombre = 'Reptil';

--chequeamos que el update se haya realizado sobre el id encontrado
SELECT * FROM Especie WHERE id_especie = 51

--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--

--revisamos que id tiene la raza canario
SELECT * FROM Raza WHERE nombre_raza = 'Labrador'

--ejecutamos el update Raza
EXEC UpdateRaza @id_raza = 53, @nombre_raza = 'Golden Retriever', @id_especie = 51;

--chequeamos que el update se haya realizado sobre el id encontrado
SELECT * FROM Raza WHERE id_raza = 53

-----------------------------------------------------------------------------------------------------------------------------
-- Eliminaciones

--Chequeamos que las id existan 

SELECT * FROM Mascota WHERE id_mascota = 364429 --id - mascota
SELECT * FROM Especie WHERE id_especie = 51 --id - especie
SELECT * FROM Raza WHERE id_raza = 53  --id - raza

--Ejecutamos los deletes correspondientes
EXEC DeleteMascota @id_mascota = 364429;
EXEC DeleteEspecie @id = 51;
EXEC DeleteRaza @id_raza = 53;

--Chequeamos que se hayan eliminado correctamente 

SELECT * FROM Mascota WHERE id_mascota = 364429 --id - mascota
SELECT * FROM Especie WHERE id_especie = 51 --id - especie
SELECT * FROM Raza WHERE id_raza = 53  --id - raza

GO

