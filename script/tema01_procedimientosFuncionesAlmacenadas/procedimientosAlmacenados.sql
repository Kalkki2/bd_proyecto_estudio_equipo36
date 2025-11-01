USE gestion_veterinaria;
GO

--- Ver todos los procedimientos almacenados de la base de datos  
SELECT name AS Procedimiento, create_date, modify_date
FROM sys.procedures
ORDER BY name;
GO

-- Ver el detalle de un procedimiento almacenado 
EXEC sp_helptext 'DeleteEspecie';


-----------------------------------------------------------------------------------------------------------------------------
------ INSERTS ---------------
-----------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS InsertMascota;
GO


CREATE PROCEDURE InsertMascota
    @nombre_mascota VARCHAR(10),
    @fecha_nacimiento DATE,
    @peso_mascota FLOAT,
    @condicion_mascota VARCHAR(50),
    @id_dueno INT,
    @id_raza INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Dueno WHERE id_dueno = @id_dueno) AND
       EXISTS (SELECT 1 FROM Raza WHERE id_raza = @id_raza)
    BEGIN
        INSERT INTO Mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza)
        VALUES (@nombre_mascota, @fecha_nacimiento, @peso_mascota, @condicion_mascota, @id_dueno, @id_raza);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de dueño o raza no existe.', 16, 1);
    END
END
GO


-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS InsertarEspecie;
GO
-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertarEspecie
    @nombre VARCHAR(30)
AS
BEGIN
    INSERT INTO Especie (nombre_especie)
    VALUES (@nombre);
END
GO
-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS InsertarRaza;
GO

CREATE PROCEDURE InsertarRaza
    @nombre_raza VARCHAR(30),
    @id_especie INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Especie WHERE id_especie = @id_especie)
    BEGIN
        INSERT INTO Raza (nombre_raza, id_especie)
        VALUES (@nombre_raza, @id_especie);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de especie no existe.', 16, 1);
    END
END
GO

-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS InsertarDueno;
GO



CREATE PROCEDURE InsertarDueno
    @nombre_dueno VARCHAR(50),
    @apellido_dueno VARCHAR(50),
    @dni_dueno VARCHAR(8),
    @telefono_dueno BIGINT,
    @email_dueno VARCHAR(50),
    @direccion_dueno VARCHAR(50)
AS
BEGIN
    INSERT INTO Dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
    VALUES (@nombre_dueno, @apellido_dueno, @dni_dueno, @telefono_dueno, @email_dueno, @direccion_dueno);
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS InsertarEspecialidad;
GO


CREATE PROCEDURE InsertarEspecialidad
    @nombre VARCHAR(30)
AS
BEGIN
    INSERT INTO Especialidad (nombre_especialidad)
    VALUES (@nombre);
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS InsertarLaboratorio;
GO


CREATE PROCEDURE InsertarLaboratorio
    @nombre_lab VARCHAR(60)
AS
BEGIN
    INSERT INTO Laboratorio (nombre_lab)
    VALUES (@nombre_lab);
END
GO

-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS InsertarMedicamento;
GO

CREATE PROCEDURE InsertarMedicamento
    @nombre_comercial VARCHAR(50),
    @monodroga_medic VARCHAR(50),
    @presentacion_medic VARCHAR(50),
    @id_laboratorio INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Laboratorio WHERE id_laboratorio = @id_laboratorio)
    BEGIN
        INSERT INTO Medicamento (nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
        VALUES (@nombre_comercial, @monodroga_medic, @presentacion_medic, @id_laboratorio);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de laboratorio no existe.', 16, 1);
    END
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS InsertarVeterinario;
GO

CREATE PROCEDURE InsertarVeterinario
    @nro_licProfesional INT,
    @nombre_profesional VARCHAR(60),
    @hora_entrada TIME,
    @hora_salida TIME,
    @id_especialidad INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Especialidad WHERE id_especialidad = @id_especialidad)
    BEGIN
        INSERT INTO Veterinario (nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
        VALUES (@nro_licProfesional, @nombre_profesional, @hora_entrada, @hora_salida, @id_especialidad);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de especialidad no existe.', 16, 1);
    END
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS InsertarCitaMedica;
GO

CREATE PROCEDURE InsertarCitaMedica
    @fecha_citaMedica DATE,
    @observaciones_citaMedica VARCHAR(70),
    @usuario VARCHAR(50),
    @motivo_visita VARCHAR(50),
    @id_mascota INT,
    @id_veterinario INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Mascota WHERE id_mascota = @id_mascota) AND
       EXISTS (SELECT 1 FROM Veterinario WHERE id_veterinario = @id_veterinario)
    BEGIN
        INSERT INTO CitasMedica (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
        VALUES (@fecha_citaMedica, @observaciones_citaMedica, @usuario, @motivo_visita, @id_mascota, @id_veterinario);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de mascota o veterinario no existe.', 16, 1);
    END
END;
GO;
-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS InsertarTratamiento;
GO

CREATE PROCEDURE InsertarTratamiento
    @nombre_tratamiento VARCHAR(50),
    @inicio_tratamiento DATE,
    @fin_tratamiento DATE,
    @id_citaMedica INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM CitasMedica WHERE id_citaMedica = @id_citaMedica)
    BEGIN
        INSERT INTO Tratamiento (nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
        VALUES (@nombre_tratamiento, @inicio_tratamiento, @fin_tratamiento, @id_citaMedica);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de cita médica no existe.', 16, 1);
    END
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------
------ GET ONE ---------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerEspeciePorID
    @id_especie INT
AS
BEGIN
    SELECT * FROM Especie WHERE id_especie = @id_especie;
END;


GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerRazaPorID
    @id_raza INT
AS
BEGIN
    SELECT * FROM Raza WHERE id_raza = @id_raza;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerDuenoPorDNI
    @dni VARCHAR(8)
AS
BEGIN
    SELECT * FROM Dueno WHERE dni_dueno = @dni;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerEspecialidadPorID
    @id_especialidad INT
AS
BEGIN
    SELECT * FROM Especialidad WHERE id_especialidad = @id_especialidad;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerLaboratorioPorID
    @id_laboratorio INT
AS
BEGIN
    SELECT * FROM Laboratorio WHERE id_laboratorio = @id_laboratorio;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerMascotaId
    @id_mascota INT
AS
BEGIN
    SELECT m.id_mascota, m.nombre_mascota, m.fecha_nacimiento, m.peso_mascota, 
           d.nombre_dueno, r.nombre_raza
    FROM Mascota m
    JOIN Dueno d ON m.id_dueno = d.id_dueno
    JOIN Raza r ON m.id_raza = r.id_raza
    WHERE m.id_mascota = @id_mascota;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerMedicamentoPorID
    @id_medicamento INT
AS
BEGIN
    SELECT * FROM Medicamento WHERE id_medicamento = @id_medicamento;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerVeterinarioPorNroLicencia
    @nro_licencia INT
AS
BEGIN
    SELECT * FROM Veterinario WHERE nro_licProfesional = @nro_licencia;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerCitaMedicaPorID
    @id_citaMedica INT
AS
BEGIN
    SELECT * FROM CitasMedica WHERE id_citaMedica = @id_citaMedica;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ObtenerMascotaPorID
    @id INT
AS
BEGIN
    SELECT *
    FROM Mascota 
    WHERE id_mascota = @id;
END;

GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE ObtenerDuenoPorDNI
    @dni VARCHAR(8)
AS
BEGIN
    SELECT * 
    FROM dueno
    WHERE dni_dueno = @dni;
END; 

GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE ObtenerEdadMascota
AS
BEGIN
    SELECT nombre_mascota, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS Edad
    FROM Mascota;
END;
GO

-----------------------------------------------------------------------------------------------------------------------------
------ UPDATE ---------------
-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateMascota
    @id_mascota INT,
    @nombre_mascota VARCHAR(10),
    @fecha_nacimiento DATE,
    @peso_mascota FLOAT,
    @condicion_mascota VARCHAR(50),
    @id_dueno INT,
    @id_raza INT
AS
BEGIN
    UPDATE Mascota
    SET nombre_mascota = @nombre_mascota,
        fecha_nacimiento = @fecha_nacimiento,
        peso_mascota = @peso_mascota,
        condicion_mascota = @condicion_mascota,
        id_dueno = @id_dueno,
        id_raza = @id_raza
    WHERE id_mascota = @id_mascota;
END;

GO;
-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateEspecie
    @id INT,
    @nombre VARCHAR(30)
AS
BEGIN
    UPDATE Especie
    SET nombre_especie = @nombre
    WHERE id_especie = @id;
END;

GO;
-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateRaza
    @id_raza INT,
    @nombre_raza VARCHAR(30),
    @id_especie INT
AS
BEGIN
    UPDATE Raza
    SET nombre_raza = @nombre_raza,
        id_especie = @id_especie
    WHERE id_raza = @id_raza;
END;

GO;

-------------------------------------------------------------------------
-------- DELETE --------------------
-------------------------------------------------------------------------

CREATE PROCEDURE DeleteMascota
    @id_mascota INT
AS
BEGIN
    DELETE FROM Mascota
    WHERE id_mascota = @id_mascota;
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE DeleteEspecie
    @id INT
AS
BEGIN
    DELETE FROM Especie
    WHERE id_especie = @id;
END;

GO;
-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE DeleteRaza
    @id_raza INT
AS
BEGIN
    DELETE FROM Raza
    WHERE id_raza = @id_raza;
END;
GO;
