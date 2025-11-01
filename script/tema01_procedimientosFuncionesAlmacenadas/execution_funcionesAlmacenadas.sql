USE gestion_veterinaria
GO
SELECT * 
FROM sys.objects 
WHERE type = 'FN' AND name = 'CalcularEdadMascota';

-----------------------------------------------------------------------------------------------------------------------------
-- Mascota : Test
SELECT * FROM Mascota 
WHERE nombre_mascota = 'Test'
GO

---------------------------------------------------------------------------------------------------------------------------
-- La función CalcularEdad utilizada sobre 1 consulta 
SELECT * FROM Mascota

SELECT nombre_mascota, dbo.CalcularEdadMascota(fecha_nacimiento) AS Edad
FROM Mascota
WHERE id_mascota = 1;
GO

---------------------------------------------------------------------------------------------------------------------------
-- Existe Entidad permite chequear si existe id en alguna tabla (Veterinario / Dueno)
SELECT dbo.ExisteEntidad(1, 'Veterinario') AS Existe; -- 1 = existe // 2 = no existe
GO

---------------------------------------------------------------------------------------------------------------------------
-- Calculo el Indice Masa corporal
SELECT nombre_mascota, dbo.CalcularIMCMascotaSimplificado(peso_mascota) AS IMC
FROM Mascota;
GO

---------------------------------------------------------------------------------------------------------------------------
