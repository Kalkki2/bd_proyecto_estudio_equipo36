## Probar JSON_VALUE, JSON_QUERY  Y OPENJSON

# Ejemplo 1: Agrega una columna JSON a una tabla existente
Aqui guarda información adicional de la mascota en formato JSON:

![image alt](img/alter_Table.png)

Luego inserta JSON al registro:

![image alt](img/insert_JSON.png)

# Ahora prueba JSON_VALUE (para valores simples):
![image alt](img/prueba_VALUE.png)

Resultado esperado:
![image alt](img/resultado.png)

# Prueba JSON_QUERY (para objetos o arrays):
![image alt](img/prueba_QUERY.png)

Resultado esperado:

![image alt](img/resultado2.png)

# Prueba OPENJSON (convertir array a filas):

![image alt](img/prueba_OPENJSON.png)

Resultado esperado:

![image alt](img/resultado3.png)

