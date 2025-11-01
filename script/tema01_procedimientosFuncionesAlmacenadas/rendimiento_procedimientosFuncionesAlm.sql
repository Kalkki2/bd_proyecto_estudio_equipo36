use gestion_veterinaria

-----------------------------------------------------------------------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Consulta directa sin procedimientos ni funciones
SELECT nombre_mascota, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS Edad
FROM Mascota;

-- Ejecucion del procedimiento almacenado 
EXEC ObtenerEdadMascota;

-- Usamos la función en una consulta
SELECT nombre_mascota, dbo.CalcularEdad(fecha_nacimiento) AS Edad
FROM Mascota;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-----------------------------------------------------------------------------------------------------------------


-- Consulta directa sin procedimientos ni funciones
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT nombre_mascota, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS Edad
FROM Mascota;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- Separador visual en la salida para distinguir entre consultas
PRINT '---------------------------------------';

-- Ejecución del procedimiento almacenado 
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

EXEC ObtenerEdadMascota;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

PRINT '---------------------------------------';

-- Uso de la función en una consulta
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT nombre_mascota, dbo.CalcularEdad(fecha_nacimiento) AS Edad
FROM Mascota;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
