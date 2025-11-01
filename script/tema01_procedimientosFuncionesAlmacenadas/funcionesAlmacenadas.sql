USE gestion_veterinaria
GO
---------------------------------------------------------------------------------------------------------------------------
-- Para ver ser un todas las funciones de mi bd 
SELECT 
    name AS NombreFuncion, 
    type_desc AS Tipo, 
    definition AS Definicion 
FROM sys.sql_modules 
JOIN sys.objects ON sys.sql_modules.object_id = sys.objects.object_id 
WHERE type IN ('FN', 'TF', 'IF'); -- se pude modificar para traer el tipo espesifico que funcion que se busque
GO
---------------------------------------------------------------------------------------------------------------------------
-- Para eliminar una funcion almacenada 
DROP FUNCTION CalcularIMCMascota;
GO 
---------------------------------------------------------------------------------------------------------------------------
-- Función para Calcular la Edad de una Mascota

CREATE FUNCTION dbo.CalcularEdadMascota (@fecha_nacimiento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT;
    SET @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE());
    
    -- Ajuste si la fecha actual aún no alcanzó el cumpleaños de este año
    IF (MONTH(@fecha_nacimiento) > MONTH(GETDATE())) OR
       (MONTH(@fecha_nacimiento) = MONTH(GETDATE()) AND DAY(@fecha_nacimiento) > DAY(GETDATE()))
    BEGIN
        SET @edad = @edad - 1;
    END
    
    RETURN @edad;
END;
GO

---------------------------------------------------------------------------------------------------------------------------
-- Función para Calcular el IMC de la Mascota

CREATE FUNCTION dbo.CalcularIMCMascota (@peso FLOAT, @altura FLOAT)
RETURNS FLOAT
AS
BEGIN
    RETURN CASE 
        WHEN @altura > 0 THEN @peso / POWER(@altura, 2)
        ELSE NULL
    END;
END;
GO

---------------------------------------------------------------------------------------------------------------------------
-- Función para Verificar Existencia de Propietario o Veterinario

CREATE FUNCTION dbo.ExisteEntidad (@id INT, @tabla VARCHAR(50))
RETURNS BIT
AS
BEGIN
    DECLARE @exists BIT;
    SET @exists = 0;
    
    IF (@tabla = 'Dueno')
        SET @exists = (SELECT CASE WHEN EXISTS (SELECT 1 FROM Dueno WHERE id_dueno = @id) THEN 1 ELSE 0 END);
    ELSE IF (@tabla = 'Veterinario')
        SET @exists = (SELECT CASE WHEN EXISTS (SELECT 1 FROM Veterinario WHERE id_veterinario = @id) THEN 1 ELSE 0 END);
    
    RETURN @exists;
END;
GO

---------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION dbo.CalcularIMCMascotaSimplificado (@peso FLOAT)
RETURNS FLOAT
AS
BEGIN
    -- Supongamos que el tamaño promedio de la mascota es una constante,
    -- por ejemplo, un valor de 0.5 (puedes adaptarlo según el tamaño promedio de tus mascotas).
    DECLARE @tamanoPromedio FLOAT = 0.5;
    
    RETURN CASE 
        WHEN @tamanoPromedio > 0 THEN @peso / POWER(@tamanoPromedio, 2)
        ELSE NULL
    END;
END;
GO

---------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION dbo.CalcularEdad (@FechaNacimiento DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @FechaNacimiento, GETDATE());
END;
GO

---------------------------------------------------------------------------------------------------------------------------