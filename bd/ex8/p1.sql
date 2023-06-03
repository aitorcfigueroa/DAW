--Crea una base de datos en postgres que se llame "bd_frutas_json". Yo ya la tengo creada la BD en mi sistema.

--Todas las tareas van en un archivo sql (p1.sql) que puedo importar a mi sistema gestor (vía i o psql o copiar/pegar el sql).

--1. Le añades una tabla que se llame "frutas" con un campo que sea clave primaria y otro que permita usar JSON, que guardará información sobre frutas.
CREATE TABLE frutas(id SERIAL NOT NULL PRIMARY KEY, frutas JSONB NOT NULL);

--2. Una fruta tiene varias propiedades:
  --Un nombre: naranja, pera, manzana, etc
  --Un diámetro (en cm): 5, 10, 15, etc
  --Un origen (ciudad): Vigo, Ourense, Santiago, etc
-- Ejemplo JSON: {"nombre": "naranja", "diámetro": 5, "origen": "Vigo"}

--3. Añade al menos 5 frutas a tu base de datos
INSERT INTO frutas (frutas) 
VALUES('{"nombre": "naranja", "diámetro": 5, "origen": "Vigo"}'),
      ('{"nombre": "pera", "diámetro": 4, "origen": "Ourense"}'),
      ('{"nombre": "manzana", "diámetro": 4, "origen": "Lugo"}'),
      ('{"nombre": "plátano", "diámetro": 3, "origen": "Pontevedra"}'),
      ('{"nombre": "sandía", "diámetro": 20, "origen": "A Coruña"}');

--4. Ponme la consulta para mostrar las frutas que vienen de Ourense
SELECT frutas FROM frutas WHERE frutas ->> 'origen'='Ourense';

--5. Muéstrame las frutas que comiencen por la letra N
SELECT frutas FROM frutas WHERE frutas ->> 'nombre' LIKE 'n%';