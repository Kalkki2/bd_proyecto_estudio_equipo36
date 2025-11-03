use gestion_citas_veterinaria

-----------------------------------------------------------------------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Consulta directa sin procedimientos ni funciones
SELECT nombre_mascota, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS Edad
FROM Mascota;

-- Ejecucion del procedimiento almacenado 
EXEC obtener_edad_mascota;

-- Usamos la función en una consulta
SELECT nombre_mascota, dbo.calcular_edad_mascota(fecha_nacimiento) AS Edad
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

EXEC obtener_edad_mascota;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

PRINT '---------------------------------------';

-- Uso de la función en una consulta
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT nombre_mascota, dbo.calcular_edad_mascota(fecha_nacimiento) AS Edad
FROM Mascota;

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
