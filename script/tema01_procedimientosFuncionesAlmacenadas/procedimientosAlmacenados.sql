USE gestion_citas_veterinaria;
GO

--- Ver todos los procedimientos almacenados de la base de datos  
SELECT name AS Procedimiento, create_date, modify_date
FROM sys.procedures
ORDER BY name;
GO

-- Ver el detalle de un procedimiento almacenado 
EXEC sp_helptext 'Deleteespecie';


-----------------------------------------------------------------------------------------------------------------------------
------ INSERTS ---------------
-----------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS insert_mascota;
GO

CREATE PROCEDURE insert_mascota
    @nombre_mascota VARCHAR(10),
    @fecha_nacimiento DATE,
    @peso_mascota FLOAT,
    @condicion_mascota VARCHAR(50),
    @id_duenio INT,
    @id_raza INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM duenio WHERE id_duenio = @id_duenio) AND
       EXISTS (SELECT 1 FROM raza WHERE id_raza = @id_raza)
    BEGIN
        INSERT INTO mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza)
        VALUES (@nombre_mascota, @fecha_nacimiento, @peso_mascota, @condicion_mascota, @id_duenio, @id_raza);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de dueño o raza no existe.', 16, 1);
    END
END
GO


-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS insertar_especie;
GO
-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE insertar_especie
    @nombre VARCHAR(30)
AS
BEGIN
    INSERT INTO especie (nombre_especie)
    VALUES (@nombre);
END
GO
-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS insertar_raza;
GO

CREATE PROCEDURE insertar_raza
    @nombre_raza VARCHAR(30),
    @id_especie INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM especie WHERE id_especie = @id_especie)
    BEGIN
        INSERT INTO raza (nombre_raza, id_especie)
        VALUES (@nombre_raza, @id_especie);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de especie no existe.', 16, 1);
    END
END
GO

-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS insertar_duenio;
GO



CREATE PROCEDURE insertar_duenio
    @nombre_duenio VARCHAR(50),
    @apellido_duenio VARCHAR(50),
    @dni_duenio VARCHAR(8),
    @telefono_duenio BIGINT,
    @email_duenio VARCHAR(50),
    @direccion_duenio VARCHAR(50)
AS
BEGIN
    INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio)
    VALUES (@nombre_duenio, @apellido_duenio, @dni_duenio, @telefono_duenio, @email_duenio, @direccion_duenio);
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS insertar_especialidad;
GO


CREATE PROCEDURE insertar_especialidad
    @nombre VARCHAR(30)
AS
BEGIN
    INSERT INTO especialidad (nombre_especialidad)
    VALUES (@nombre);
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS insertar_laboratorio;
GO


CREATE PROCEDURE insertar_laboratorio
    @nombre_lab VARCHAR(60)
AS
BEGIN
    INSERT INTO laboratorio (nombre_lab)
    VALUES (@nombre_lab);
END
GO

-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS insertar_medicamento;
GO

CREATE PROCEDURE insertar_medicamento
    @nombre_comercial VARCHAR(50),
    @monodroga_medic VARCHAR(50),
    @presentacion_medic VARCHAR(50),
    @id_laboratorio INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM laboratorio WHERE id_laboratorio = @id_laboratorio)
    BEGIN
        INSERT INTO medicamento (nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
        VALUES (@nombre_comercial, @monodroga_medic, @presentacion_medic, @id_laboratorio);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de laboratorio no existe.', 16, 1);
    END
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS insertar_veterinario;
GO

CREATE PROCEDURE insertar_veterinario
    @nro_licProfesional INT,
    @nombre_profesional VARCHAR(60),
    @hora_entrada TIME,
    @hora_salida TIME,
    @id_especialidad INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM especialidad WHERE id_especialidad = @id_especialidad)
    BEGIN
        INSERT INTO veterinario (nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
        VALUES (@nro_licProfesional, @nombre_profesional, @hora_entrada, @hora_salida, @id_especialidad);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de especialidad no existe.', 16, 1);
    END
END;
GO;

-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS insertar_cita_medica;
GO

CREATE PROCEDURE insertar_cita_medica
    @fecha_citaMedica DATE,
    @observaciones_citaMedica VARCHAR(70),
    @usuario VARCHAR(50),
    @motivo_visita VARCHAR(50),
    @id_mascota INT,
    @id_veterinario INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM mascota WHERE id_mascota = @id_mascota) AND
       EXISTS (SELECT 1 FROM veterinario WHERE id_veterinario = @id_veterinario)
    BEGIN
        INSERT INTO citas_medica (
			fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario
		)
        VALUES (@fecha_citaMedica, @observaciones_citaMedica, @usuario, @motivo_visita, @id_mascota, @id_veterinario);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de mascota o veterinario no existe.', 16, 1);
    END
END;
GO;
-------------------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS insertar_tratamiento;
GO

CREATE PROCEDURE insertar_tratamiento
    @nombre_tratamiento VARCHAR(50),
    @inicio_tratamiento DATE,
    @fin_tratamiento DATE,
    @id_citaMedica INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM citas_medica WHERE id_citaMedica = @id_citaMedica)
    BEGIN
        INSERT INTO tratamiento (nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
        VALUES (@nombre_tratamiento, @inicio_tratamiento, @fin_tratamiento, @id_citaMedica);
    END
    ELSE
    BEGIN
        RAISERROR('El ID de cita médica no existe.', 16, 1);
    END
END
GO

-----------------------------------------------------------------------------------------------------------------------------
------ GET ONE ---------------
-----------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_especie_por_id
    @id_especie INT
AS
BEGIN
    SELECT * FROM especie WHERE id_especie = @id_especie;
END;


GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_raza_por_id
    @id_raza INT
AS
BEGIN
    SELECT * FROM raza WHERE id_raza = @id_raza;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_duenio_por_dni
    @dni VARCHAR(8)
AS
BEGIN
    SELECT * FROM duenio WHERE dni_duenio = @dni;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_especialidad_por_id
    @id_especialidad INT
AS
BEGIN
    SELECT * FROM especialidad WHERE id_especialidad = @id_especialidad;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_laboratorio_por_id
    @id_laboratorio INT
AS
BEGIN
    SELECT * FROM laboratorio WHERE id_laboratorio = @id_laboratorio;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_mascota_id
    @id_mascota INT
AS
BEGIN
    SELECT m.id_mascota, m.nombre_mascota, m.fecha_nacimiento, m.peso_mascota, 
           d.nombre_duenio, r.nombre_raza
    FROM mascota m
    JOIN duenio d ON m.id_duenio = d.id_duenio
    JOIN raza r ON m.id_raza = r.id_raza
    WHERE m.id_mascota = @id_mascota;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_medicamento_por_id
    @id_medicamento INT
AS
BEGIN
    SELECT * FROM medicamento WHERE id_medicamento = @id_medicamento;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_veterinario_por_nro_licencia
    @nro_licencia INT
AS
BEGIN
    SELECT * FROM veterinario WHERE nro_licProfesional = @nro_licencia;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_cita_medica_por_id
    @id_citaMedica INT
AS
BEGIN
    SELECT * FROM citas_medica WHERE id_citaMedica = @id_citaMedica;
END;

GO;

-------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_mascota_por_id
    @id INT
AS
BEGIN
    SELECT *
    FROM mascota 
    WHERE id_mascota = @id;
END;

GO;

-----------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE obtener_duenio_por_dni
    @dni VARCHAR(8)
AS
BEGIN
    SELECT * 
    FROM duenio
    WHERE dni_duenio = @dni;
END; 
GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE obtener_edad_mascota
AS
BEGIN
    SELECT nombre_mascota, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS Edad
    FROM mascota;
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------
------ UPDATE ---------------
-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE update_mascota
    @id_mascota INT,
    @nombre_mascota VARCHAR(10),
    @fecha_nacimiento DATE,
    @peso_mascota FLOAT,
    @condicion_mascota VARCHAR(50),
    @id_duenio INT,
    @id_raza INT
AS
BEGIN
    UPDATE mascota
    SET nombre_mascota = @nombre_mascota,
        fecha_nacimiento = @fecha_nacimiento,
        peso_mascota = @peso_mascota,
        condicion_mascota = @condicion_mascota,
        id_duenio = @id_duenio,
        id_raza = @id_raza
    WHERE id_mascota = @id_mascota;
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE update_especie
    @id INT,
    @nombre VARCHAR(30)
AS
BEGIN
    UPDATE especie
    SET nombre_especie = @nombre
    WHERE id_especie = @id;
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE update_raza
    @id_raza INT,
    @nombre_raza VARCHAR(30),
    @id_especie INT
AS
BEGIN
    UPDATE raza
    SET nombre_raza = @nombre_raza,
        id_especie = @id_especie
    WHERE id_raza = @id_raza;
END;
GO;

-------------------------------------------------------------------------
-------- DELETE --------------------
-------------------------------------------------------------------------

CREATE PROCEDURE delete_mascota
    @id_mascota INT
AS
BEGIN
    DELETE FROM mascota
    WHERE id_mascota = @id_mascota;
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE delete_especie
    @id INT
AS
BEGIN
    DELETE FROM especie
    WHERE id_especie = @id;
END;
GO;

-----------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE delete_raza
    @id_raza INT
AS
BEGIN
    DELETE FROM raza
    WHERE id_raza = @id_raza;
END;
GO;
