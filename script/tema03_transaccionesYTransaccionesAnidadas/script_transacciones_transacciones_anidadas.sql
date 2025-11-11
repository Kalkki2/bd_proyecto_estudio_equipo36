USE gestion_citas_veterinaria
GO

--******************************************
--         TRANSACCION SIMPLE
--******************************************

--Transaccion exitosa

DECLARE @id_duenio INT; -- Se declara una variable que guarda el ID del dueño recién insertado.

BEGIN TRANSACTION;  --Inicio de la transaccion
BEGIN TRY
    -- Insertar Dueño
    INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio)
    VALUES ('Ana', 'López', '59321213', 3794935410, 'ana6699L@gmail.com', 'San Martín 123');

    SET @id_duenio = SCOPE_IDENTITY(); -- Se asigna el ID del Dueño recién insertado

    -- Insertar Mascota
    INSERT INTO mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza)
    VALUES ('Toby', '2020-06-15', 5.8, 'Sano', @id_duenio, 2);

    -- Si ambas inserciones se ejecutan sin errores, la transacción se confirma.
    COMMIT TRANSACTION;
    PRINT '-----------------------------------------------------';
    PRINT 'Dueño y mascota registrados correctamente!';
END TRY
BEGIN CATCH
    -- El ROLLBACK revierte toda la transaccion
    ROLLBACK TRANSACTION;
    PRINT '-----------------------------------------------------';
    PRINT 'Error al registrar el dueño o la mascota.';
    -- Si falló antes de asignar el dueño, mostrará “NULL/No asignado”.
    PRINT 'El valor de @id_dueno antes del error era: ' + ISNULL(CAST(@id_duenio AS VARCHAR(50)), 'NULL/No asignado');
    PRINT 'Mensaje de Error: ' + ERROR_MESSAGE();  -- Muestra el mensaje de error SQL

END CATCH;
GO


--Transaccion fallida

DECLARE @id_duenio INT; -- Se declara una variable que guarda el ID del dueño recién insertado.

BEGIN TRANSACTION;  --Inicio de la transaccion
BEGIN TRY
    -- Insertar Dueño
    INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio)
    VALUES ('Juan', 'Perez', '43948978', 3794935410, 'juannPerez@gmail.com', 'San Martín 123');

    SET @id_duenio = SCOPE_IDENTITY(); -- Se asigna el ID del Dueño recién insertado

    -- Insertar Mascota
    INSERT INTO mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza)
    VALUES ('Yacki', '2020-02-5', 6.8, 'Sano', @id_duenio, 2);

    -- Si ambas inserciones se ejecutan sin errores, la transacción se confirma.
    COMMIT TRANSACTION;
    PRINT '-----------------------------------------------------';
    PRINT 'Dueño y mascota registrados correctamente!';
END TRY
BEGIN CATCH
    -- El ROLLBACK revierte toda la transaccion
    ROLLBACK TRANSACTION;
    PRINT '-----------------------------------------------------';
    PRINT 'Error al registrar el dueño o la mascota.';
    -- Si falló antes de asignar el dueño, mostrará “NULL/No asignado”.
    PRINT 'El valor de @id_dueno antes del error era: ' + ISNULL(CAST(@id_duenio AS VARCHAR(50)), 'NULL/No asignado');
    PRINT 'Mensaje de Error: ' + ERROR_MESSAGE();  -- Muestra el mensaje de error SQL

END CATCH;
GO






--******************************************
--       TRANSACCIONES ANIDADAS
--******************************************

--Transaccion anidada exitosa

DECLARE @id_cita INT;        -- Variable para guardar el ID generado de la cita médica
DECLARE @id_tratamiento INT; -- Variable para guardar el ID generado del tratamiento

-- NIVEL 1: Transacción Principal (Registro de la Cita)
BEGIN TRANSACTION CitaPrincipal;  -- Inicia la transacción principal. Todo lo que ocurra adentro depende de ella.
BEGIN TRY   -- Inicia un bloque de control de errores TRY/CATCH
    --  Registrar una cita médica
    INSERT INTO citas_medica (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
    VALUES (GETDATE(), ' dolor de cabeza', SYSTEM_USER, 'Dolor persistente', 7, 1);

    SET @id_cita = SCOPE_IDENTITY();     -- Guarda el ID recién generado de la cita
    PRINT 'Cita médica registrada correctamente.';

    -- NIVEL 2: Transacción anidada (Registro de Tratamiento y Medicamento)
    BEGIN TRANSACTION TratamientoAnidado;  -- Abre una nueva transacción dentro de la principal (incrementa @@TRANCOUNT)
    BEGIN TRY
        --   Registrar el tratamiento vinculado a la cita
        INSERT INTO tratamiento (nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
        VALUES ('Tratamiento con analgésicos', '2025-11-03', '2025-12-03', @id_cita);

        SET @id_tratamiento = SCOPE_IDENTITY(); --Guarda el ID generado del tratamiento
        PRINT ' Tratamiento registrado correctamente.';

        -- Registrar un tratamiento_medicamento, Forzamos un error (medicamento inexistente)
        INSERT INTO tratamiento_medicamento (id_medicamento, id_tratamiento)
        VALUES (1, @id_tratamiento);
        
        PRINT ' Medicamento vinculado correctamente.';
        PRINT '---------------------------------------------';

        -- Si todo salió bien dentro del bloque anidado:
        COMMIT TRANSACTION TratamientoAnidado;  -- Cierra la transacción interna
        PRINT 'Transacción interna confirmada.';
    END TRY
    BEGIN CATCH
        -- Si ocurre un error dentro de la transacción anidada:
        PRINT ' Error en la transacción interna (Tratamiento o Medicamento).';
        PRINT ERROR_MESSAGE();  -- Muestra el mensaje de error SQL
        ROLLBACK TRANSACTION;   -- Este ROLLBACK deshace TODO (no solo el bloque anidado), porque SQL Server no permite revertir parcialmente sin SAVEPOINT.
    END CATCH;

     -- Si todo salió bien hasta acá, se confirma la transacción principal
    IF @@TRANCOUNT > 0        -- Verifica si aún queda una transacción abierta
    BEGIN
        COMMIT TRANSACTION CitaPrincipal;   -- Confirma todo (Cita + Tratamiento + Medicamento)
        PRINT 'Transacción principal confirmada (Cita + Tratamiento + Medicamento).';
    END
    ELSE
    BEGIN -- Si hubo error en la interna, @@TRANCOUNT ya es 0
        PRINT 'La transacción principal no se confirmó porque hubo un error interno.';
    END
END TRY
BEGIN CATCH
    -- Si ocurre un error fuera del bloque interno (en la cita)
    PRINT 'Error en la transacción principal.';
    PRINT ERROR_MESSAGE();    -- Muestra el error SQL exacto
    ROLLBACK TRANSACTION;   -- Revierte todo lo hecho
    PRINT ' Se revirtió toda la transacción.';
END CATCH;
GO


--Transaccion anidada fallida

DECLARE @id_cita INT;        -- Variable para guardar el ID generado de la cita médica
DECLARE @id_tratamiento INT; -- Variable para guardar el ID generado del tratamiento

-- NIVEL 1: Transacción Principal (Registro de la Cita)
BEGIN TRANSACTION CitaPrincipal;  -- Inicia la transacción principal. Todo lo que ocurra adentro depende de ella.
BEGIN TRY   -- Inicia un bloque de control de errores TRY/CATCH
    --  Registrar una cita médica
    INSERT INTO citas_medica (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
    VALUES ('2025-11-03', ' dolor de cabeza', 'admin', 'Dolor persistente', 7, 1);

    SET @id_cita = SCOPE_IDENTITY();     -- Guarda el ID recién generado de la cita
    PRINT 'Cita médica registrada correctamente.';

    -- NIVEL 2: Transacción anidada (Registro de Tratamiento y Medicamento)
    BEGIN TRANSACTION TratamientoAnidado;  -- Abre una nueva transacción dentro de la principal (incrementa @@TRANCOUNT)
    BEGIN TRY
        --   Registrar el tratamiento vinculado a la cita
        INSERT INTO tratamiento (nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
        VALUES ('Tratamiento con analgésicos', '2025-11-03', '2025-12-03', @id_cita);

        SET @id_tratamiento = SCOPE_IDENTITY(); --Guarda el ID generado del tratamiento
        PRINT ' Tratamiento registrado correctamente.';

        -- Registrar un tratamiento_medicamento, Forzamos un error (medicamento inexistente)
        INSERT INTO tratamiento_medicamento (id_medicamento, id_tratamiento)
        VALUES (999, @id_tratamiento);
        
        PRINT ' Medicamento vinculado correctamente.';
         PRINT '---------------------------------------------';

        -- Si todo salió bien dentro del bloque anidado:
        COMMIT TRANSACTION TratamientoAnidado;  -- Cierra la transacción interna
        PRINT 'Transacción interna confirmada.';
    END TRY
    BEGIN CATCH
        -- Si ocurre un error dentro de la transacción anidada:
        PRINT ' Error en la transacción interna (Tratamiento o Medicamento).';
        PRINT ERROR_MESSAGE();  -- Muestra el mensaje de error SQL
        ROLLBACK TRANSACTION;   -- Este ROLLBACK deshace TODO (no solo el bloque anidado), porque SQL Server no permite revertir parcialmente sin SAVEPOINT.
    END CATCH;

    -- Si todo salió bien hasta acá, se confirma la transacción principal
    IF @@TRANCOUNT > 0   -- Verifica si aún queda una transacción abierta
    BEGIN
        COMMIT TRANSACTION CitaPrincipal;  -- Confirma todo (Cita + Tratamiento + Medicamento)
        PRINT 'Transacción principal confirmada (Cita + Tratamiento + Medicamento).';
    END
    ELSE
    BEGIN-- Si hubo error en la interna, @@TRANCOUNT ya es 0
        PRINT 'La transacción principal no se confirmó porque hubo un error interno.';
    END
END TRY
BEGIN CATCH
    -- Si ocurre un error fuera del bloque interno (en la cita)
    PRINT 'Error en la transacción principal.';
    PRINT ERROR_MESSAGE();    -- Muestra el error SQL exacto
    ROLLBACK TRANSACTION;   -- Revierte todo lo hecho
    PRINT 'Se revirtió toda la transacción.';
END CATCH;
GO
