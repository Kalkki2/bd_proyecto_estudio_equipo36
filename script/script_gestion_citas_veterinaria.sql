CREATE DATABASE gestion_citas_veterinaria;
GO

USE gestion_citas_veterinaria;
GO

-------------------
IF OBJECT_ID('tratamiento_medicamento') IS NOT NULL DROP TABLE tratamiento_medicamento;
GO
IF OBJECT_ID('tratamiento') IS NOT NULL DROP TABLE tratamiento;
GO
IF OBJECT_ID('citas_medica') IS NOT NULL DROP TABLE citas_medica;
GO
IF OBJECT_ID('veterinario') IS NOT NULL DROP TABLE veterinario;
GO
IF OBJECT_ID('medicamento') IS NOT NULL DROP TABLE medicamento;
GO
IF OBJECT_ID('mascota') IS NOT NULL DROP TABLE mascota;
GO
IF OBJECT_ID('laboratorio') IS NOT NULL DROP TABLE laboratorio;
GO
IF OBJECT_ID('especialidad') IS NOT NULL DROP TABLE especialidad;
GO
IF OBJECT_ID('duenio') IS NOT NULL DROP TABLE duenio;
GO
IF OBJECT_ID('raza') IS NOT NULL DROP TABLE raza;
GO
IF OBJECT_ID('especie') IS NOT NULL DROP TABLE especie;
GO

-------------------
CREATE TABLE especie(
  id_especie INT IDENTITY(1,1),
  nombre_especie VARCHAR(30) NOT NULL,

  CONSTRAINT PK_especie PRIMARY KEY (id_especie)
);
GO

-------------------
CREATE TABLE raza(
  id_raza INT IDENTITY(1,1),
  nombre_raza VARCHAR(30) NOT NULL,
  id_especie INT NOT NULL,

  CONSTRAINT PK_raza PRIMARY KEY (id_raza),
  CONSTRAINT FK_raza_especie FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);
GO

-------------------
CREATE TABLE duenio(
  id_duenio INT IDENTITY(1,1),
  nombre_duenio VARCHAR(50) NOT NULL,
  apellido_duenio VARCHAR(50) NOT NULL,
  dni_duenio VARCHAR(8) NOT NULL,
  telefono_duenio BIGINT NOT NULL,  
  email_duenio VARCHAR(50) NOT NULL,
  direccion_duenio VARCHAR(50) NOT NULL,

  CONSTRAINT PK_duenio PRIMARY KEY (id_duenio),
  CONSTRAINT UQ_duenio_dni UNIQUE (dni_duenio),
  CONSTRAINT UQ_duenio_telefono UNIQUE (telefono_duenio),
  CONSTRAINT UQ_duenio_email UNIQUE (email_duenio)
);
GO

-------------------
CREATE TABLE especialidad(
  id_especialidad INT IDENTITY(1,1),
  nombre_especialidad VARCHAR(60) NOT NULL,

  CONSTRAINT PK_especialidad PRIMARY KEY (id_especialidad)
);
GO

-------------------
CREATE TABLE laboratorio(
  id_laboratorio INT IDENTITY(1,1),
  nombre_lab VARCHAR(60) NOT NULL,

  CONSTRAINT PK_laboratorio PRIMARY KEY (id_laboratorio)
);
GO

-------------------
CREATE TABLE mascota(
  id_mascota INT IDENTITY(1,1),
  nombre_mascota VARCHAR(10) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  peso_mascota FLOAT NOT NULL,
  condicion_mascota VARCHAR(50),
  id_duenio INT NOT NULL,
  id_raza INT NOT NULL,

  CONSTRAINT PK_mascota PRIMARY KEY (id_mascota),
  CONSTRAINT FK_mascota_duenio FOREIGN KEY (id_duenio) REFERENCES duenio(id_duenio),
  CONSTRAINT FK_mascota_raza FOREIGN KEY (id_raza) REFERENCES raza(id_raza)
);
GO

-------------------
CREATE TABLE medicamento(
  id_medicamento INT IDENTITY(1,1),
  nombre_comercial VARCHAR(50) NOT NULL,
  monodroga_medic VARCHAR(50) NOT NULL,
  presentacion_medic VARCHAR(50) NOT NULL,
  id_laboratorio INT NOT NULL,

  CONSTRAINT PK_medicamento PRIMARY KEY (id_medicamento),
  CONSTRAINT FK_medicamento_laboratorio FOREIGN KEY (id_laboratorio) REFERENCES laboratorio(id_laboratorio)
);
GO

-------------------
CREATE TABLE veterinario(
  id_veterinario INT IDENTITY(1,1),
  nro_licProfesional INT NOT NULL,
  nombre_profesional VARCHAR(60) NOT NULL,
  hora_entrada TIME NOT NULL,  
  hora_salida TIME NOT NULL,   
  id_especialidad INT,

  CONSTRAINT PK_veterinario PRIMARY KEY (id_veterinario),
  CONSTRAINT FK_veterinario_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
  CONSTRAINT UQ_veterinario_nro_licProfesional UNIQUE (nro_licProfesional)
);
GO

-------------------
CREATE TABLE citas_medica(
  id_citaMedica INT IDENTITY(1,1),
  fecha_citaMedica DATE NOT NULL, 
  observaciones_citaMedica VARCHAR(70) NOT NULL,
  usuario VARCHAR(50) NOT NULL, -- Corrección de SYSTEM_USER a USER_NAME()
  motivo_visita VARCHAR(50) NOT NULL,
  id_mascota INT NOT NULL,
  id_veterinario INT NOT NULL,

  CONSTRAINT PK_citas_medica PRIMARY KEY (id_citaMedica),
  CONSTRAINT FK_citas_medica_mascota FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota),
  CONSTRAINT FK_citas_medica_veterinario FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario)
);
GO

-------------------
CREATE TABLE tratamiento(
  id_tratamiento INT IDENTITY(1,1),
  nombre_tratamiento VARCHAR(50),
  inicio_tratamiento DATE NOT NULL,
  fin_tratamiento DATE NOT NULL,
  id_citaMedica INT NOT NULL,

  CONSTRAINT PK_tratamiento PRIMARY KEY (id_tratamiento),
  CONSTRAINT FK_tratamiento_citas_medica FOREIGN KEY (id_citaMedica) REFERENCES citas_medica(id_citaMedica)
);
GO

-------------------
CREATE TABLE tratamiento_medicamento(
  id_medicamento INT NOT NULL,
  id_tratamiento INT NOT NULL,

  CONSTRAINT PK_tratamiento_medicamento PRIMARY KEY (id_medicamento, id_tratamiento),
  CONSTRAINT FK_tratamiento_medicamento_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento),
  CONSTRAINT FK_tratamiento_medicamento_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id_tratamiento),
);


-- Restricciones

ALTER TABLE citas_medica ADD CONSTRAINT DF_citasMedica_fecha_citamedica DEFAULT GETDATE() FOR fecha_citaMedica;
ALTER TABLE citas_medica ADD CONSTRAINT DF_CitasMedica_usario DEFAULT SYSTEM_USER FOR usuario;
ALTER TABLE duenio ADD CONSTRAINT CK_duenio_dni CHECK (LEN(dni_duenio) = 8 AND ISNUMERIC(dni_duenio) = 1);

ALTER TABLE mascota
ADD CONSTRAINT CK_mascota_fecha_nacimiento
CHECK (fecha_nacimiento >= DATEADD(YEAR, -30, GETDATE()));

