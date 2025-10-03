# PRESENTACIÓN: Sistema de Gestion de Informacion para Clinica Veterinaria

---

**Asignatura: Bases de Datos I (FaCENA-UNNE)**

**Integrantes**
- Albarracin, Anibal
- Beck, Pablo Adrian
- Diaz, Federico Hilario
- Encina, Nahuel

## Índice
[Capítulo I: Introducción](#capítulo-i-introducción)
[Capítulo IV: Desarrollo del Tema / Resultados](#capítulo-iv-desarrollo-del-tema--resultados)

---

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

Una clínica veterinaria desea implementar una base de datos para gestionar la información de sus pacientes (mascotas), dueños, citas médicas y tratamientos.

- Cada mascota tiene un código único de identificación. Se desea almacenar el nombre, especie (perro, gato, ave, etc.), raza, fecha de nacimiento, peso y cualquier condición médica especial en caso de existir. Ej: Alérgico a droga (Nombre droga)
- Los dueños de las mascotas son registrados con un número de identificación único. Además, se almacenan datos personales como DNI, nombre, dirección, teléfono y correo electrónico.
- Las citas medicas son espontaneas y se registran al momento de la visita de la mascota a la veterinaria.
- Se registra el motivo de la cita, el veterinario asignado y cualquier observación posterior a la cita. Una cita está asociada a una única mascota y a un único veterinario.
- De cada veterinario se desea guardar su número de licencia profesional, nombre completo, especialidad (si la tiene, por ejemplo, ortopedia, oftalmología, etc.) y horario de atención.
- Si a una mascota se le prescribe un tratamiento, se desea registrar el nombre del tratamiento, duración, Medicamentos indicados y cualquier otra indicación relevante.
- El tratamiento, en caso de existir, debe estar asociado a una cita.
- En una misma cita, el veterinario puede indicar mas de un tratamiento.
- Un tratamiento debe permitir la aplicación de varios medicamentos
- De los medicamentos se necesita conocer: Nombre comercial, monodroga, presentación y laboratorio que lo comercializa.

Se deben considerar las siguientes restricciones en el diseño físico:

- La longitud del campo ‘dni’ debe ser igual o menor a 8 caracteres
- El campo ‘correo_electronico’ debe ser un valor único.
- El campo ‘fecha’ por defecto toma la fecha actual.
- La edad de la mascota no puede superar los 30 años.
- Se debe registrar en forma automática la fecha del sistema y usuario de base de datos que crean los registros de citas.
- Agregar estos dos campos a la tabla.

### Tema: Implementacion de una Base de datos para la Gestion de una Clinica Veterinaria.

**Definicion del Problema:** La clínica veterinaria necesita una solución para gestionar eficientemente la información de sus pacientes, dueños, citas médicas y tratamientos.

### Objetivo del Trabajo Práctico (_qué se va a hacer_)

**Objetivo General:** Desarrollar una base de datos que permita la gestión integral de la información en una clínica veterinaria.

**Objetivos Específicos:**
- Implementar el manejo de permisos a nivel de usuarios.
- Crear procedimientos y funciones almacenadas para la gestión de datos.
- Optimizar consultas mediante el uso de índices.

**Requisitos:**
- Mascotas: Código único, nombre, especie, raza, fecha de nacimiento, peso, condiciones médicas especiales.
- Dueños: Número de identificación único, DNI, nombre, dirección, teléfono, correo electrónico.
- Citas Médicas: Motivo de la cita, veterinario asignado, observaciones, asociada a una mascota y un veterinario.
- Veterinarios: Número de licencia profesional, nombre completo, especialidad, horario de atención.
- Tratamientos: Nombre del tratamiento, duración, medicamentos indicados, indicaciones relevantes, asociado a una cita.
- Medicamentos: Nombre comercial, monodroga, presentación, laboratori

**Alcance**
- Mejorar la organización y acceso a la información de mascotas y dueños.
- Facilitar el registro y seguimiento de citas médicas y tratamientos.
- Asegurar la integridad y seguridad de los datos.

## CAPÍTULO IV: DESARROLLO DEL TEMA / RESULTADOS
## Diseño del modelo relacional para el sistema: Gestión Veterinaria.
Este modelo captura la estructura básica de un sistema para registrar información sobre dueños, mascotas, citas veterinarias, tratamientos y medicamentos utilizado en la clínica veterinaria.

## Diagrama relacional
![image alt](https://github.com/Kalkki2/bd_proyecto_estudio_equipo36/blob/aacb6835c241d76cc9752af2823fd95d59820726/docs/Modelo_Relacional_Veterinaria.png)
