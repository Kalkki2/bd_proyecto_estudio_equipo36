CREATE DATABASE gestion_citas_veterinaria;
GO

USE gestion_citas_veterinaria;
GO

CREATE TABLE especialidad(
  id_especialidad INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,

  CONSTRAINT pk_especialidad PRIMARY KEY (id_especialidad)
);

CREATE TABLE veterinario(
  id_veterinario INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  hora_entrada TIME NOT NULL,  
  hora_salida TIME NOT NULL,   
  nro_lic_profesional INT NOT NULL,
  id_especialidad INT NOT NULL,

  CONSTRAINT pk_veterinario PRIMARY KEY (id_veterinario),
  CONSTRAINT fk_veterinario_especialidad FOREIGN KEY (id_especialidad)REFERENCES especialidad(id_especialidad),
  CONSTRAINT uq_veterinario_nro_lic_profesional UNIQUE (nro_lic_profesional)
);

CREATE TABLE duenio(
  id_duenio INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  dni INT NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(150) NOT NULL,

  CONSTRAINT pk_duenio PRIMARY KEY (id_duenio),
  CONSTRAINT uq_duenio_dni UNIQUE (dni),
  CONSTRAINT uq_duenio_telefono UNIQUE (telefono),
  CONSTRAINT uq_duenio_email UNIQUE (email),
  CONSTRAINT ck_duenio_dni CHECK(len(dni) = 8)
);

CREATE TABLE especie(
  id_especie INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT pk_especie PRIMARY KEY (id_especie)
);

CREATE TABLE raza(
  id_raza INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  id_especie INT NOT NULL,

  CONSTRAINT pk_raza PRIMARY KEY (id_raza, id_especie),
  CONSTRAINT fk_raza_especie FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);

CREATE TABLE mascota(
  id_mascota INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  peso FLOAT NOT NULL,
  condicion VARCHAR(100) NOT NULL,
  id_duenio INT NOT NULL,
  id_raza INT NOT NULL,
  id_especie INT NOT NULL,

  CONSTRAINT pk_mascota PRIMARY KEY (id_mascota),
  CONSTRAINT fk_mascota_duenio FOREIGN KEY (id_duenio)REFERENCES duenio(id_duenio),
  CONSTRAINT fk_mascota_raza FOREIGN KEY (id_raza, id_especie)REFERENCES raza(id_raza, id_especie),
  CONSTRAINT ck_mascota_edad CHECK (DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) < 30)
);

CREATE TABLE cita_medica(
  id_cita_medica INT NOT NULL,
  fecha_cita DATE NOT NULL CONSTRAINT df_cita_medica_fecha_cita DEFAULT GETDATE(),
  motivo VARCHAR(150) NOT NULL,
  observaciones VARCHAR(250) NOT NULL ,
  usuario VARCHAR(100) NOT NULL  CONSTRAINT df_cita_medica_usario DEFAULT SYSTEM_USER FOR usuario,
  id_mascota INT NOT NULL,
  id_veterinario INT NOT NULL,
  CONSTRAINT pk_cita_medica PRIMARY KEY (id_cita_medica),
  CONSTRAINT fk_cita_medica_mascota FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota),
  CONSTRAINT fk_cita_medica_veterinario FOREIGN KEY (id_veterinario)REFERENCES veterinario(id_veterinario)
);

CREATE TABLE laboratorio(
  id_laboratorio INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(200) NOT NULL,

  CONSTRAINT pk_laboratorio PRIMARY KEY (id_laboratorio)
);

CREATE TABLE medicamento(
  id_medicamento INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  monodroga VARCHAR(100) NOT NULL,
  presentacion VARCHAR(150) NOT NULL,
  id_laboratorio INT NOT NULL,

  CONSTRAINT pk_medicamento PRIMARY KEY (id_medicamento),
  CONSTRAINT fk_medicamento_laboratorio FOREIGN KEY (id_laboratorio)REFERENCES laboratorio(id_laboratorio)
);

CREATE TABLE tipo_tratamiento(
  id_tratamiento INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT pk_tipo_tratamiento PRIMARY KEY (id_tratamiento)
);

CREATE TABLE tratamiento_mascota(
  fecha_inicio DATE NOT NULL,
  dosis VARCHAR(50) NOT NULL,
  fecha_fin DATE NOT NULL,
  id_tratamiento INT NOT NULL,
  id_medicamento INT NOT NULL,
  id_cita_medica INT NOT NULL,

  CONSTRAINT pk_tratamiento_mascota PRIMARY KEY (id_tratamiento, id_cita_medica),
  CONSTRAINT fk_tratamiento_mascota_tipo_tratamiento FOREIGN KEY (id_tratamiento)REFERENCES tipo_tratamiento(id_tratamiento),
  CONSTRAINT fk_tratamiento_mascota_medicamento FOREIGN KEY (id_medicamento)REFERENCES medicamento(id_medicamento),
  CONSTRAINT fk_tratamiento_mascota_cita_medica FOREIGN KEY (id_cita_medica) REFERENCES cita_medica(id_cita_medica)
);