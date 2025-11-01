USE gestion_citas_veterinaria;

-- Insertar especies de animales
INSERT INTO especie (nombre_especie) VALUES ('Canis lupus');       -- Lobo
INSERT INTO especie (nombre_especie) VALUES ('Panthera leo');      -- León
INSERT INTO especie (nombre_especie) VALUES ('Elephas maximus');   -- Elefante
INSERT INTO especie (nombre_especie) VALUES ('Gorilla beringei');  -- Gorila
INSERT INTO especie (nombre_especie) VALUES ('Equus ferus');       -- Caballo
INSERT INTO especie (nombre_especie) VALUES ('Felis catus');       -- Gato
INSERT INTO especie (nombre_especie) VALUES ('Bos taurus');        -- Vaca
INSERT INTO especie (nombre_especie) VALUES ('Canis familiaris');  -- Perro
INSERT INTO especie (nombre_especie) VALUES ('Gallus gallus');     -- Gallina
INSERT INTO especie (nombre_especie) VALUES ('Ovis aries');        -- Oveja

-- 11-20
INSERT INTO especie (nombre_especie) VALUES ('Sus scrofa');        -- Cerdo
INSERT INTO especie (nombre_especie) VALUES ('Panthera onca');     -- Jaguar
INSERT INTO especie (nombre_especie) VALUES ('Balaenoptera musculus'); -- Ballena azul
INSERT INTO especie (nombre_especie) VALUES ('Spheniscus humboldti');  -- Pingüino de Humboldt
INSERT INTO especie (nombre_especie) VALUES ('Chelonia mydas');    -- Tortuga verde
INSERT INTO especie (nombre_especie) VALUES ('Ailuropoda melanoleuca'); -- Oso panda
INSERT INTO especie (nombre_especie) VALUES ('Acinonyx jubatus');  -- Guepardo
INSERT INTO especie (nombre_especie) VALUES ('Crocodylus porosus'); -- Cocodrilo de agua salada
INSERT INTO especie (nombre_especie) VALUES ('Ursus arctos');      -- Oso pardo
INSERT INTO especie (nombre_especie) VALUES ('Pavo cristatus');    -- Pavo real

-- 21-30
INSERT INTO especie (nombre_especie) VALUES ('Macropus giganteus'); -- Canguro gigante
INSERT INTO especie (nombre_especie) VALUES ('Rattus norvegicus');  -- Rata
INSERT INTO especie (nombre_especie) VALUES ('Haliaeetus leucocephalus'); -- Águila calva
INSERT INTO especie (nombre_especie) VALUES ('Bison bison');        -- Bisonte americano
INSERT INTO especie (nombre_especie) VALUES ('Phascolarctos cinereus'); -- Koala
INSERT INTO especie (nombre_especie) VALUES ('Loxodonta africana'); -- Elefante africano
INSERT INTO especie (nombre_especie) VALUES ('Puma concolor');      -- Puma
INSERT INTO especie (nombre_especie) VALUES ('Phoenicopterus ruber'); -- Flamenco
INSERT INTO especie (nombre_especie) VALUES ('Ara ararauna');       -- Guacamayo azul y amarillo
INSERT INTO especie (nombre_especie) VALUES ('Hippopotamus amphibius'); -- Hipopótamo

-- 31-40
INSERT INTO especie (nombre_especie) VALUES ('Sphenodon punctatus'); -- Tuátara
INSERT INTO especie (nombre_especie) VALUES ('Mustela putorius furo'); -- Hurón
INSERT INTO especie (nombre_especie) VALUES ('Vulpes vulpes');       -- Zorro rojo
INSERT INTO especie (nombre_especie) VALUES ('Pan troglodytes');     -- Chimpancé
INSERT INTO especie (nombre_especie) VALUES ('Struthio camelus');    -- Avestruz
INSERT INTO especie (nombre_especie) VALUES ('Eudyptula minor');     -- Pingüino azul
INSERT INTO especie (nombre_especie) VALUES ('Giraffa camelopardalis'); -- Jirafa
INSERT INTO especie (nombre_especie) VALUES ('Tursiops truncatus');  -- Delfín mular
INSERT INTO especie (nombre_especie) VALUES ('Delphinapterus leucas'); -- Beluga
INSERT INTO especie (nombre_especie) VALUES ('Choloepus hoffmanni'); -- Perezoso de dos dedos

-- 41-50
INSERT INTO especie (nombre_especie) VALUES ('Hydrochoerus hydrochaeris'); -- Carpincho
INSERT INTO especie (nombre_especie) VALUES ('Pongo pygmaeus');      -- Orangután
INSERT INTO especie (nombre_especie) VALUES ('Sphyrna lewini');      -- Tiburón martillo
INSERT INTO especie (nombre_especie) VALUES ('Phoenicoparrus andinus'); -- Flamenco andino
INSERT INTO especie (nombre_especie) VALUES ('Falco peregrinus');    -- Halcón peregrino
INSERT INTO especie (nombre_especie) VALUES ('Panthera tigris');     -- Tigre
INSERT INTO especie (nombre_especie) VALUES ('Carcharodon carcharias'); -- Tiburón blanco
INSERT INTO especie (nombre_especie) VALUES ('Odobenus rosmarus');   -- Morsa
INSERT INTO especie (nombre_especie) VALUES ('Aptenodytes forsteri'); -- Pingüino emperador
INSERT INTO especie (nombre_especie) VALUES ('Lynx lynx');           -- Lince europeo

-- Registros para la tabla raza
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Labrador Retriever', 1);   -- Canis lupus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Husky Siberiano', 1);     -- Canis lupus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Pastor Alemán', 1);       -- Canis lupus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('León Africano', 2);       -- Panthera leo
INSERT INTO raza (nombre_raza, id_especie) VALUES ('León Asiático', 2);       -- Panthera leo
INSERT INTO raza (nombre_raza, id_especie) VALUES ('León del Atlas', 2);      -- Panthera leo

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Elefante de Sri Lanka', 3); -- Elephas maximus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Elefante de Sumatra', 3);  -- Elephas maximus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Gorila de Montaña', 4);   -- Gorilla beringei
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Gorila de Tierras Bajas', 4); -- Gorilla beringei

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Caballo Árabe', 5);       -- Equus ferus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Caballo Pura Sangre', 5); -- Equus ferus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Gato Persa', 6);          -- Felis catus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Gato Siamés', 6);         -- Felis catus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Vaca Holstein', 7);       -- Bos taurus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Vaca Jersey', 7);         -- Bos taurus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Pastor Alemán', 8);       -- Canis familiaris
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Bulldog Inglés', 8);      -- Canis familiaris

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Gallina Leghorn', 9);     -- Gallus gallus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Gallina Sussex', 9);      -- Gallus gallus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Oveja Merina', 10);       -- Ovis aries
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Oveja Suffolk', 10);      -- Ovis aries

-- 21-30
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Cerdo Ibérico', 11);      -- Sus scrofa
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Cerdo Yorkshire', 11);    -- Sus scrofa

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Jaguar Negro', 12);       -- Panthera onca
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Jaguar Americano', 12);   -- Panthera onca

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Ballena Azul del Norte', 13); -- Balaenoptera musculus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Ballena Azul del Sur', 13);   -- Balaenoptera musculus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Pingüino de Magallanes', 14); -- Spheniscus humboldti
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Pingüino Rey', 14);           -- Spheniscus humboldti

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Tortuga Verde del Atlántico', 15); -- Chelonia mydas
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Tortuga Verde del Pacífico', 15);  -- Chelonia mydas

-- 31-40
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Panda Gigante', 16);       -- Ailuropoda melanoleuca
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Panda Qinling', 16);       -- Ailuropoda melanoleuca

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Guepardo Asiático', 17);   -- Acinonyx jubatus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Guepardo Africano', 17);   -- Acinonyx jubatus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Cocodrilo de Estuario', 18); -- Crocodylus porosus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Cocodrilo de Agua Dulce', 18); -- Crocodylus porosus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Oso Kodiak', 19);          -- Ursus arctos
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Oso Grizzly', 19);         -- Ursus arctos

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Pavo Real Azul', 20);      -- Pavo cristatus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Pavo Real Blanco', 20);    -- Pavo cristatus

-- 41-50
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Canguro Rojo', 21);        -- Macropus giganteus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Canguro Gris', 21);        -- Macropus giganteus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Rata Albina', 22);         -- Rattus norvegicus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Rata Noruega', 22);        -- Rattus norvegicus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Águila Calva Americana', 23); -- Haliaeetus leucocephalus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Águila Calva Canadiense', 23); -- Haliaeetus leucocephalus

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Bisonte Llanero', 24);     -- Bison bison
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Bisonte de Bosque', 24);   -- Bison bison

INSERT INTO raza (nombre_raza, id_especie) VALUES ('Koala Oriental', 25);      -- Phascolarctos cinereus
INSERT INTO raza (nombre_raza, id_especie) VALUES ('Koala Occidental', 25);    -- Phascolarctos cinereus


--- Registros de la tabla duenio 
INSERT INTO duenio (nombre_duenio, apellido_duenio, dni_duenio, telefono_duenio, email_duenio, direccion_duenio) VALUES
('Carlos', 'Fernandez', '12345678', 1123456789, 'carlos.fernandez@example.com', 'Calle 1'),
('Maria', 'Lopez', '23456789', 1123456790, 'maria.lopez@example.com', 'Calle 2'),
('Jorge', 'Martinez', '34567890', 1123456791, 'jorge.martinez@example.com', 'Calle 3'),
('Ana', 'Gonzalez', '45678901', 1123456792, 'ana.gonzalez@example.com', 'Calle 4'),
('Luis', 'Ramirez', '56789012', 1123456793, 'luis.ramirez@example.com', 'Calle 5'),
('Laura', 'Sanchez', '67890123', 1123456794, 'laura.sanchez@example.com', 'Calle 6'),
('Pedro', 'Perez', '78901234', 1123456795, 'pedro.perez@example.com', 'Calle 7'),
('Paula', 'Torres', '89012345', 1123456796, 'paula.torres@example.com', 'Calle 8'),
('Andres', 'Vargas', '90123456', 1123456797, 'andres.vargas@example.com', 'Calle 9'),
('Lucia', 'Castillo', '12345679', 1123456798, 'lucia.castillo@example.com', 'Calle 10'),
('Santiago', 'Moreno', '23456780', 1123456799, 'santiago.moreno@example.com', 'Calle 11'),
('Valeria', 'Suarez', '34567891', 1123456800, 'valeria.suarez@example.com', 'Calle 12'),
('Martin', 'Mendez', '45678902', 1123456801, 'martin.mendez@example.com', 'Calle 13'),
('Jazmin', 'Aguirre', '56789013', 1123456802, 'jazmin.aguirre@example.com', 'Calle 14'),
('Claudio', 'Silva', '67890124', 1123456803, 'claudio.silva@example.com', 'Calle 15'),
('Sofia', 'Ortiz', '78901235', 1123456804, 'sofia.ortiz@example.com', 'Calle 16'),
('Guillermo', 'Cruz', '89012346', 1123456805, 'guillermo.cruz@example.com', 'Calle 17'),
('Raul', 'Vega', '90123457', 1123456806, 'raul.vega@example.com', 'Calle 18'),
('Lorena', 'Romero', '12345680', 1123456807, 'lorena.romero@example.com', 'Calle 19'),
('Fernando', 'Barrera', '23456781', 1123456808, 'fernando.barrera@example.com', 'Calle 20'),
('Adriana', 'Paz', '34567892', 1123456809, 'adriana.paz@example.com', 'Calle 21'),
('Felipe', 'Diaz', '45678903', 1123456810, 'felipe.diaz@example.com', 'Calle 22'),
('Veronica', 'Ponce', '56789014', 1123456811, 'veronica.ponce@example.com', 'Calle 23'),
('Gabriel', 'Campos', '67890125', 1123456812, 'gabriel.campos@example.com', 'Calle 24'),
('Micaela', 'Luna', '78901236', 1123456813, 'micaela.luna@example.com', 'Calle 25'),
('Sebastian', 'Figueroa', '89012347', 1123456814, 'sebastian.figueroa@example.com', 'Calle 26'),
('Nicolas', 'Vidal', '90123458', 1123456815, 'nicolas.vidal@example.com', 'Calle 27'),
('Marta', 'Rios', '12345681', 1123456816, 'marta.rios@example.com', 'Calle 28'),
('Diego', 'Soto', '23456782', 1123456817, 'diego.soto@example.com', 'Calle 29'),
('Clara', 'Correa', '34567893', 1123456818, 'clara.correa@example.com', 'Calle 30'),
('Patricio', 'Acosta', '45678904', 1123456819, 'patricio.acosta@example.com', 'Calle 31'),
('Daniela', 'Bravo', '56789015', 1123456820, 'daniela.bravo@example.com', 'Calle 32'),
('Federico', 'Molina', '67890126', 1123456821, 'federico.molina@example.com', 'Calle 33'),
('Julieta', 'Castro', '78901237', 1123456822, 'julieta.castro@example.com', 'Calle 34'),
('Emilio', 'Fuentes', '89012348', 1123456823, 'emilio.fuentes@example.com', 'Calle 35'),
('Ariana', 'Bustos', '90123459', 1123456824, 'ariana.bustos@example.com', 'Calle 36'),
('Ezequiel', 'Espinosa', '12345682', 1123456825, 'ezequiel.espinosa@example.com', 'Calle 37'),
('Rocio', 'Quiroga', '23456783', 1123456826, 'rocio.quiroga@example.com', 'Calle 38'),
('Matias', 'Villalba', '34567894', 1123456827, 'matias.villalba@example.com', 'Calle 39'),
('Pilar', 'Medina', '45678905', 1123456828, 'pilar.medina@example.com', 'Calle 40'),
('Esteban', 'Salinas', '56789016', 1123456829, 'esteban.salinas@example.com', 'Calle 41'),
('Camila', 'Serrano', '67890127', 1123456830, 'camila.serrano@example.com', 'Calle 42'),
('Francisco', 'Lopez', '78901238', 1123456831, 'francisco.lopez@example.com', 'Calle 43'),
('Marcelo', 'Navarro', '89012349', 1123456832, 'marcelo.navarro@example.com', 'Calle 44'),
('Mariana', 'Beltran', '90123460', 1123456833, 'mariana.beltran@example.com', 'Calle 45'),
('Joaquin', 'Oliva', '12345683', 1123456834, 'joaquin.oliva@example.com', 'Calle 46'),
('Tamara', 'Santana', '23456784', 1123456835, 'tamara.santana@example.com', 'Calle 47'),
('Renzo', 'Flores', '34567895', 1123456836, 'renzo.flores@example.com', 'Calle 48'),
('Valentina', 'Gonzalez', '45678906', 1123456837, 'valentina.gonzalez@example.com', 'Calle 49'),
('Carlos', 'Fernandez', '56789017', 1123456838, 'carlos.fernandez123@example.com', 'Calle 50');


-- INSERTS DE especialidadES
INSERT INTO especialidad (nombre_especialidad) VALUES
('Medicina General'),
('Cirugía Veterinaria'),
('Cardiología Veterinaria'),
('Dermatología Veterinaria'),
('Oftalmología Veterinaria'),
('Oncología Veterinaria'),
('Neurología Veterinaria'),
('Ortopedia Veterinaria'),
('Endocrinología Veterinaria'),
('Nefrología Veterinaria'),
('Geriatría Veterinaria'),
('Odontología Veterinaria'),
('Nutrición Animal'),
('Comportamiento Animal'),
('Toxicología Veterinaria'),
('Anestesiología Veterinaria'),
('Radiología Veterinaria'),
('Patología Veterinaria'),
('Reproducción Animal'),
('Farmacología Veterinaria'),
('Epidemiología Veterinaria'),
('Microbiología Veterinaria'),
('Parasitología Veterinaria'),
('Inmunología Veterinaria'),
('Zootecnia'),
('Genética Veterinaria'),
('Terapia Física y Rehabilitación'),
('Medicina Preventiva'),
('Medicina de Animales de Compañía'),
('Medicina de Animales Exóticos'),
('Medicina de Aves'),
('Medicina de Animales de Granja'),
('Medicina de Animales Acuáticos'),
('Salud Pública Veterinaria'),
('Medicina Interna'),
('Oncología Quirúrgica'),
('Fisioterapia Veterinaria'),
('Terapia del Dolor Veterinaria'),
('Hematología Veterinaria'),
('Patología Clínica'),
('Citología Veterinaria'),
('Ultrasonografía Veterinaria'),
('Medicina de Felinos'),
('Medicina de Perros de Trabajo'),
('Medicina Deportiva'),
('Medicina de Urgencias'),
('Medicina Transfusional'),
('Traumatología Veterinaria'),
('Zoología Veterinaria'),
('Rehabilitación Postquirúrgica'),
('Ecocardiografía Veterinaria');

-- INSERTS laboratorioS
INSERT INTO laboratorio (nombre_lab) VALUES
('LabVetPlus'),
('VetLab Central'),
('BioVetLab'),
('LabCareVet'),
('VetExpertLab'),
('LabVetech'),
('PetVetLab'),
('AnimalCareLab'),
('VetSolutionsLab'),
('LabPetHealth'),
('VetLab Services'),
('VetLabPlus'),
('MedVetLab'),
('HealthyPetsLab'),
('AdvancedVetLab'),
('VetLab Diagnostics'),
('BioCareLab'),
('ProVetLab'),
('VetTechLab'),
('AnimalMedLab'),
('PremiumVetLab'),
('LabVetScience'),
('EliteVetLab'),
('LabPetCare'),
('VetLab Specialists'),
('PrecisionVetLab'),
('VetBioLab'),
('LabVetCare'),
('LabProVet'),
('VetHealthLab'),
('AnimalVetLab'),
('PetHealth Diagnostics'),
('VetLab Systems'),
('InnovativeVetLab'),
('VetLab Partners'),
('VetLab Solutions'),
('AnimalDiagnostics'),
('VetCareLab'),
('BioPetLab'),
('PetHealthLab'),
('SuperiorVetLab'),
('VetLab Experts'),
('AnimalLabPlus'),
('ProVet Diagnostics'),
('LabCareVetPlus'),
('AnimalLab Services'),
('BioVet Solutions'),
('VetDiagnosticLab'),
('LabVetXpert'),
('AnimalHealth Lab');

--INSERTS mascotaS
INSERT INTO mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_duenio, id_raza) VALUES
('Rex', '2020-05-14', 25.5, 'Saludable', 1, 1),
('Bella', '2019-02-20', 10.2, 'Saludable', 2, 2),
('Max', '2021-07-30', 15.7, 'Alérgico a pulgas', 3, 3),
('Luna', '2020-09-05', 8.6, 'Problema de cadera', 4, 4),
('Rocky', '2018-11-23', 22.4, 'Sobrepeso', 5, 5),
('Nala', '2022-01-17', 12.3, 'Saludable', 6, 6),
('Simba', '2021-04-21', 20.1, 'Problemas digestivos', 7, 7),
('Toby', '2020-03-09', 18.0, 'Saludable', 8, 8),
('Daisy', '2019-10-25', 9.5, 'Artritis', 9, 9),
('Milo', '2020-07-12', 5.7, 'Problema de piel', 10, 10),
('Buddy', '2021-11-29', 22.3, 'Saludable', 11, 1),
('Coco', '2022-02-14', 7.8, 'Saludable', 12, 2),
('Charlie', '2019-05-18', 18.6, 'Epilepsia', 13, 3),
('Lucy', '2020-06-05', 13.4, 'Saludable', 14, 4),
('Molly', '2021-01-27', 11.2, 'Diabetes', 15, 5),
('Leo', '2018-12-15', 14.9, 'Saludable', 16, 6),
('Lola', '2021-05-22', 16.8, 'Problema respiratorio', 17, 7),
('Buster', '2020-08-10', 10.5, 'Saludable', 18, 8),
('Chloe', '2019-09-02', 6.4, 'Insuficiencia renal', 19, 9),
('Bailey', '2020-10-13', 9.1, 'Saludable', 20, 10),
('Zoe', '2022-03-15', 3.5, 'Saludable', 21, 1),
('Oscar', '2021-09-28', 14.7, 'Problemas cardíacos', 22, 2),
('Lily', '2020-11-08', 9.8, 'Saludable', 23, 3),
('Duke', '2019-12-20', 25.6, 'Problema en la piel', 24, 4),
('Sadie', '2021-03-02', 8.1, 'Saludable', 25, 5),
('Jack', '2020-07-17', 19.4, 'Alérgico a ciertos alimentos', 26, 6),
('Ruby', '2019-06-11', 12.6, 'Saludable', 27, 7),
('Lulu', '2021-08-19', 16.2, 'Problema en las articulaciones', 28, 8),
('Murphy', '2020-09-25', 13.0, 'Saludable', 29, 9),
('Ginger', '2019-01-13', 6.8, 'Asma', 30, 10),
('Oliver', '2022-04-07', 4.3, 'Saludable', 31, 1),
('Rosie', '2020-05-22', 11.5, 'Problema ocular', 32, 2),
('Sam', '2019-02-26', 21.9, 'Problema cardíaco', 33, 3),
('Maggie', '2021-03-30', 7.4, 'Saludable', 34, 4),
('Benny', '2020-01-18', 18.1, 'Problema digestivo', 35, 5),
('Ellie', '2019-11-11', 15.6, 'Saludable', 36, 6),
('Duke', '2022-06-30', 22.9, 'Saludable', 37, 7),
('Marley', '2020-02-04', 17.5, 'Problema respiratorio', 38, 8),
('Roxy', '2019-07-20', 10.3, 'Saludable', 39, 9),
('Archie', '2021-12-10', 12.1, 'Diabetes', 40, 10),
('Hazel', '2020-09-14', 7.2, 'Problema de piel', 41, 1),
('Jake', '2019-03-19', 26.1, 'Sobrepeso', 42, 2),
('Gizmo', '2022-01-07', 9.6, 'Saludable', 43, 3),
('Sasha', '2021-04-16', 8.9, 'Problema de cadera', 44, 4),
('Nina', '2020-06-22', 12.4, 'Saludable', 45, 5),
('Tank', '2019-05-30', 23.0, 'Problema digestivo', 46, 6),
('Scout', '2022-02-18', 5.5, 'Saludable', 47, 7),
('Pepper', '2021-07-21', 16.7, 'Problema cardíaco', 48, 8),
('Bruno', '2019-09-09', 19.3, 'Saludable', 49, 9),
('Izzy', '2020-08-01', 7.9, 'Problema ocular', 50, 10);

--Inserts de medicamentos
INSERT INTO medicamento (nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
VALUES
('Antibiótico A', 'Amoxicilina', 'Tabletas', 1),
('Antiinflamatorio B', 'Ibuprofeno', 'Suspensión', 2),
('Antiparasitario C', 'Fenbendazol', 'Tabletas', 3),
('Vacuna D', 'Rabia', 'Frascos', 1),
('Antialérgico E', 'Cetirizina', 'Gotas', 2),
('Antibiótico F', 'Doxiciclina', 'Tabletas', 3),
('Suplemento G', 'Glucosamina', 'Polvo', 1),
('Antiparasitario H', 'Praziquantel', 'Tabletas', 2),
('Analgesico I', 'Paracetamol', 'Tabletas', 3),
('Antiinflamatorio J', 'Naproxeno', 'Suspensión', 1),
('Antibiótico K', 'Clindamicina', 'Tabletas', 2),
('Vacuna L', 'Moquillo', 'Frascos', 3),
('Antiparasitario M', 'Pyrantel', 'Tabletas', 1),
('Antialérgico N', 'Loratadina', 'Gotas', 2),
('Suplemento O', 'Omega 3', 'Cápsulas', 3),
('Antibiótico P', 'Cefalexina', 'Suspensión', 1),
('Analgesico Q', 'Ketorolaco', 'Tabletas', 2),
('Antiinflamatorio R', 'Aspirina', 'Tabletas', 3),
('Antiparasitario S', 'Selamectina', 'Spot-on', 1),
('Antibiótico T', 'Enrofloxacina', 'Tabletas', 2),
('Vacuna U', 'Leptospirosis', 'Frascos', 3),
('Antialérgico V', 'Fexofenadina', 'Tabletas', 1),
('Suplemento W', 'Calcio', 'Cápsulas', 2),
('Antiinflamatorio X', 'Meloxicam', 'Suspensión', 3),
('Antibiótico Y', 'Ampicilina', 'Tabletas', 1),
('Antiparasitario Z', 'Ivermectina', 'Inyección', 2),
('Analgesico AA', 'Flunixin', 'Inyección', 3),
('Vacuna AB', 'Parvovirus', 'Frascos', 1),
('Antialérgico AC', 'Desloratadina', 'Tabletas', 2),
('Antibiótico AD', 'Tilmicosina', 'Inyección', 3),
('Suplemento AE', 'Vitamina E', 'Cápsulas', 1),
('Antiinflamatorio AF', 'Carprofeno', 'Suspensión', 2),
('Antiparasitario AG', 'Moxidectina', 'Spot-on', 3),
('Antibiótico AH', 'Rifampicina', 'Tabletas', 1),
('Vacuna AI', 'Trivalente', 'Frascos', 2),
('Antialérgico AJ', 'Montelukast', 'Tabletas', 3),
('Analgesico AK', 'Buprenorfina', 'Inyección', 1),
('Suplemento AL', 'Probioticos', 'Polvo', 2),
('Antiparasitario AM', 'Dichlorvos', 'Tabletas', 3),
('Antiinflamatorio AN', 'Aines', 'Suspensión', 1),
('Antibiótico AO', 'Cefotaxima', 'Inyección', 2),
('Vacuna AP', 'Bordetella', 'Frascos', 3),
('Suplemento AQ', 'Biotina', 'Cápsulas', 1),
('Antialérgico AR', 'Levocetirizina', 'Tabletas', 2),
('Antiparasitario AS', 'Metronidazol', 'Tabletas', 3);


--Inserts de veterinarios
INSERT INTO veterinario (nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad) VALUES
(10001, 'Carlos Fernandez', '08:00', '16:00', 1),
(10002, 'Maria Lopez', '09:00', '17:00', 2),
(10003, 'Jorge Martinez', '10:00', '18:00', 3),
(10004, 'Ana Gonzalez', '08:30', '16:30', 4),
(10005, 'Luis Ramirez', '09:30', '17:30', 5),
(10006, 'Laura Sanchez', '08:00', '16:00', 6),
(10007, 'Pedro Perez', '10:00', '18:00', 7),
(10008, 'Paula Torres', '09:00', '17:00', 8),
(10009, 'Andres Vargas', '08:30', '16:30', 9),
(10010, 'Lucia Castillo', '08:00', '16:00', 10),
(10011, 'Santiago Moreno', '09:00', '17:00', 11),
(10012, 'Valeria Suarez', '10:00', '18:00', 12),
(10013, 'Martin Mendez', '08:30', '16:30', 13),
(10014, 'Jazmin Aguirre', '09:30', '17:30', 14),
(10015, 'Claudio Silva', '08:00', '16:00', 15),
(10016, 'Sofia Ortiz', '09:00', '17:00', 16),
(10017, 'Guillermo Cruz', '10:00', '18:00', 17),
(10018, 'Raul Vega', '08:30', '16:30', 18),
(10019, 'Lorena Romero', '09:30', '17:30', 19),
(10020, 'Fernando Barrera', '08:00', '16:00', 20),
(10021, 'Adriana Paz', '09:00', '17:00', 21),
(10022, 'Felipe Diaz', '10:00', '18:00', 22),
(10023, 'Veronica Ponce', '08:30', '16:30', 23),
(10024, 'Gabriel Campos', '09:30', '17:30', 24),
(10025, 'Micaela Luna', '08:00', '16:00', 25),
(10026, 'Sebastian Figueroa', '09:00', '17:00', 26),
(10027, 'Nicolas Vidal', '10:00', '18:00', 27),
(10028, 'Marta Rios', '08:30', '16:30', 28),
(10029, 'Diego Soto', '09:30', '17:30', 29),
(10030, 'Clara Correa', '08:00', '16:00', 30),
(10031, 'Patricio Acosta', '09:00', '17:00', 31),
(10032, 'Daniela Bravo', '10:00', '18:00', 32),
(10033, 'Federico Molina', '08:30', '16:30', 33),
(10034, 'Julieta Castro', '09:30', '17:30', 34),
(10035, 'Emilio Fuentes', '08:00', '16:00', 35),
(10036, 'Ariana Bustos', '09:00', '17:00', 36),
(10037, 'Ezequiel Espinosa', '10:00', '18:00', 37),
(10038, 'Rocio Quiroga', '08:30', '16:30', 38),
(10039, 'Matias Villalba', '09:30', '17:30', 39),
(10040, 'Pilar Medina', '08:00', '16:00', 40),
(10041, 'Esteban Salinas', '09:00', '17:00', 41),
(10042, 'Camila Serrano', '10:00', '18:00', 42),
(10043, 'Francisco Lopez', '08:30', '16:30', 43),
(10044, 'Marcelo Navarro', '09:30', '17:30', 44),
(10045, 'Mariana Beltran', '08:00', '16:00', 45),
(10046, 'Joaquin Oliva', '09:00', '17:00', 46),
(10047, 'Tamara Santana', '10:00', '18:00', 47),
(10048, 'Renzo Flores', '08:30', '16:30', 48),
(10049, 'Valentina Gonzalez', '09:30', '17:30', 49),
(10050, 'Carlos Fernandez', '08:00', '16:00', 50);

--Inserts en la tabla citas_medica
INSERT INTO citas_medica (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
VALUES
(GETDATE(), 'Revisión anual', SYSTEM_USER, 'Chequeo general', 1, 1),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna antirrábica', 2, 2),
(GETDATE(), 'Problemas digestivos', SYSTEM_USER, 'Consulta por diarrea', 3, 3),
(GETDATE(), 'Corte de uñas', SYSTEM_USER, 'Mantenimiento de uñas', 4, 4),
(GETDATE(), 'Infección en la piel', SYSTEM_USER, 'Consulta por infección', 5, 5),
(GETDATE(), 'Revisión dental', SYSTEM_USER, 'Chequeo de dientes', 6, 6),
(GETDATE(), 'Problemas respiratorios', SYSTEM_USER, 'Consulta por tos', 7, 7),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna parvovirus', 8, 8),
(GETDATE(), 'Golpe en la pata', SYSTEM_USER, 'Consulta por lesión', 9, 9),
(GETDATE(), 'Problemas oculares', SYSTEM_USER, 'Consulta por irritación', 10, 10),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta anual', 11, 11),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna triple felina', 12, 12),
(GETDATE(), 'Revisión auditiva', SYSTEM_USER, 'Chequeo de oídos', 13, 13),
(GETDATE(), 'Alergia en la piel', SYSTEM_USER, 'tratamiento de alergia', 14, 14),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna leptospirosis', 15, 15),
(GETDATE(), 'Problemas en el pelaje', SYSTEM_USER, 'Consulta por caída de pelo', 16, 16),
(GETDATE(), 'Chequeo de heridas', SYSTEM_USER, 'Consulta por cicatrización', 17, 17),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Revisión postoperatoria', 18, 18),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna hepatitis', 19, 19),
(GETDATE(), 'Problemas digestivos', SYSTEM_USER, 'Consulta por vómitos', 20, 20),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta preventiva', 21, 21),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna moquillo', 22, 22),
(GETDATE(), 'Revisión dental', SYSTEM_USER, 'Limpieza dental', 23, 23),
(GETDATE(), 'Revisión ocular', SYSTEM_USER, 'Chequeo de ojos', 24, 24),
(GETDATE(), 'Problemas digestivos', SYSTEM_USER, 'Consulta por estreñimiento', 25, 25),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta preventiva', 26, 26),
(GETDATE(), 'Problemas respiratorios', SYSTEM_USER, 'Consulta por bronquitis', 27, 27),
(GETDATE(), 'Revisión auditiva', SYSTEM_USER, 'Chequeo de oídos', 28, 28),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna contra parásitos', 29, 29),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Chequeo de rutina', 30, 30),
(GETDATE(), 'Revisión postoperatoria', SYSTEM_USER, 'Chequeo de suturas', 31, 31),
(GETDATE(), 'Problemas oculares', SYSTEM_USER, 'Consulta por conjuntivitis', 32, 32),
(GETDATE(), 'Revisión dental', SYSTEM_USER, 'Consulta de limpieza', 33, 33),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna rabia felina', 34, 34),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta de revisión', 35, 35),
(GETDATE(), 'Problemas digestivos', SYSTEM_USER, 'Consulta por diarrea', 36, 36),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta preventiva', 37, 37),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna contra moquillo', 38, 38),
(GETDATE(), 'Problemas respiratorios', SYSTEM_USER, 'Consulta por asma', 39, 39),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Chequeo anual', 40, 40),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna contra parvovirus', 41, 41),
(GETDATE(), 'Problemas en el pelaje', SYSTEM_USER, 'Consulta por alopecia', 42, 42),
(GETDATE(), 'Chequeo postoperatorio', SYSTEM_USER, 'Revisión de cirugía', 43, 43),
(GETDATE(), 'Problemas respiratorios', SYSTEM_USER, 'Consulta por neumonía', 44, 44),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna leptospirosis', 45, 45),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta por revisión', 46, 46),
(GETDATE(), 'Vacunación', SYSTEM_USER, 'Vacuna contra rabia', 47, 47),
(GETDATE(), 'Revisión auditiva', SYSTEM_USER, 'Chequeo de oídos', 48, 48),
(GETDATE(), 'Chequeo general', SYSTEM_USER, 'Consulta de rutina', 49, 49),
(GETDATE(), 'Problemas digestivos', SYSTEM_USER, 'Consulta por vómitos', 50, 50);


--Inserts en la tabla tratamientos
INSERT INTO tratamiento (nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
VALUES
('tratamiento A', '2024-09-01', '2024-09-10', 1),
('tratamiento B', '2024-09-02', '2024-09-07', 2),
('tratamiento C', '2024-09-03', '2024-09-03', 3),
('tratamiento D', '2024-09-05', '2024-09-12', 4),
('tratamiento E', '2024-09-06', '2024-09-13', 5),
('tratamiento F', '2024-09-07', '2024-09-07', 6),
('tratamiento G', '2024-09-08', '2024-09-15', 7),
('tratamiento H', '2024-09-09', '2024-09-09', 8),
('tratamiento I', '2024-09-10', '2024-09-17', 9),
('tratamiento J', '2024-09-11', '2024-09-16', 10),
('tratamiento K', '2024-09-12', '2024-09-18', 11),
('tratamiento L', '2024-09-13', '2024-09-13', 12),
('tratamiento M', '2024-09-14', '2024-09-19', 13),
('tratamiento N', '2024-09-15', '2024-09-21', 14),
('tratamiento O', '2024-09-16', '2024-09-16', 15),
('tratamiento P', '2024-09-17', '2024-09-22', 16),
('tratamiento Q', '2024-09-18', '2024-09-25', 17),
('tratamiento R', '2024-09-19', '2024-09-26', 18),
('tratamiento S', '2024-09-20', '2024-09-20', 19),
('tratamiento T', '2024-09-21', '2024-09-27', 20),
('tratamiento U', '2024-09-22', '2024-09-22', 21),
('tratamiento V', '2024-09-23', '2024-09-23', 22),
('tratamiento W', '2024-09-24', '2024-09-24', 23),
('tratamiento X', '2024-09-25', '2024-09-29', 24),
('tratamiento Y', '2024-09-26', '2024-09-30', 25),
('tratamiento Z', '2024-09-27', '2024-10-04', 26),
('tratamiento AA', '2024-09-28', '2024-10-05', 27),
('tratamiento AB', '2024-09-29', '2024-10-05', 28),
('tratamiento AC', '2024-09-30', '2024-09-30', 29),
('tratamiento AD', '2024-10-01', '2024-10-01', 30),
('tratamiento AE', '2024-10-02', '2024-10-08', 31),
('tratamiento AF', '2024-10-03', '2024-10-09', 32),
('tratamiento AG', '2024-10-04', '2024-10-04', 33),
('tratamiento AH', '2024-10-05', '2024-10-05', 34),
('tratamiento AI', '2024-10-06', '2024-10-06', 35),
('tratamiento AJ', '2024-10-07', '2024-10-12', 36),
('tratamiento AK', '2024-10-08', '2024-10-08', 37),
('tratamiento AL', '2024-10-09', '2024-10-09', 38),
('tratamiento AM', '2024-10-10', '2024-10-16', 39),
('tratamiento AN', '2024-10-11', '2024-10-11', 40),
('tratamiento AO', '2024-10-12', '2024-10-12', 41),
('tratamiento AP', '2024-10-13', '2024-10-14', 42),
('tratamiento AQ', '2024-10-14', '2024-10-14', 43),
('tratamiento AR', '2024-10-15', '2024-10-15', 44),
('tratamiento AS', '2024-10-16', '2024-10-17', 45),
('tratamiento AT', '2024-10-17', '2024-10-17', 46),
('tratamiento AU', '2024-10-18', '2024-10-18', 47),
('tratamiento AV', '2024-10-19', '2024-10-19', 48),
('tratamiento AW', '2024-10-20', '2024-10-20', 49),
('tratamiento AX', '2024-10-21', '2024-10-21', 50);


--Inserts de la tabla tratamiento_medicamento
INSERT INTO tratamiento_medicamento (id_medicamento, id_tratamiento)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12),
(15, 13),
(16, 14),
(17, 15),
(18, 16),
(19, 17),
(20, 18),
(21, 19),
(22, 20),
(23, 21),
(24, 22),
(25, 23),
(26, 24),
(27, 25),
(28, 26),
(29, 27),
(30, 28),
(31, 29),
(32, 30),
(33, 31),
(34, 32),
(35, 33),
(36, 34),
(37, 35),
(38, 36),
(39, 37),
(40, 38),
(41, 39),
(42, 40),
(43, 41),
(44, 42),
(45, 43),
(45, 44),
(45, 45),
(45, 46),
(45, 47),
(33, 48);

-- Mostrar todos los registros de las tablas
SELECT * FROM especie;
SELECT * FROM raza;
SELECT * FROM duenio;
SELECT * FROM especialidad;
SELECT * FROM laboratorio;
SELECT * FROM mascota;
SELECT * FROM veterinario;
SELECT * FROM medicamento;
SELECT * FROM citas_medica;
SELECT * FROM tratamiento;
SELECT * FROM tratamiento_medicamento;


-- Contador de registro total
SELECT 
t.name
 AS tabla, SUM(p.rows) AS row_count
FROM sys.tables AS t
INNER JOIN sys.partitions AS p ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)  -- 0 para heaps (tablas sin índice clustered) y 1 para índices clustered
GROUP BY 
t.name ORDER BY row_count DESC; 


-- Salida esperada : 

-- raza 52
-- especialidad 51
-- especie 50
-- laboratorio 50
-- mascota 50
-- tratamiento 50
-- tratamiento medico 50
-- veterinario 50
-- citas_medica 50
-- duenio 50
-- medicamento 45 