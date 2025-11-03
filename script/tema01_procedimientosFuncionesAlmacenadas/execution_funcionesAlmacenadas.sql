USE gestion_citas_veterinaria;
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

SELECT nombre_mascota, dbo.calcular_edad_mascota(fecha_nacimiento) AS Edad
FROM mascota
WHERE id_mascota = 1;
GO

---------------------------------------------------------------------------------------------------------------------------
-- Existe Entidad permite chequear si existe id en alguna tabla (Veterinario / Dueno)
SELECT dbo.ExisteEntidad(1, 'Veterinario') AS Existe; -- 1 = existe // 2 = no existe
GO

---------------------------------------------------------------------------------------------------------------------------
-- Calculo el Indice Masa corporal
SELECT nombre_mascota, dbo.calcular_imc_mascota(peso_mascota, 3) AS IMC
FROM mascota;
GO

---------------------------------------------------------------------------------------------------------------------------
