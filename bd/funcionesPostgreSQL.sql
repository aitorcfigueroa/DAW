---------------------------------------------------------------------------------
--Matemáticas, de agregación y y de sistema
---------------------------------------------------------------------------------
--Quiero conocer el valor máximo de 50,67,89 y 80
SELECT GREATEST(50,67,89,80);

--¿Y la media?
SELECT AVG(n) FROM (VALUES (50),(67),(89),(80)) t(n);

--¿Cuántos valores son?
SELECT COUNT(n) FROM (VALUES (50),(67),(89),(80)) t(n);

--Quiero redondear 34,5678 a un máximo de dos decimales
SELECT ROUND(34.5678, 2);

--Quiero crear un número aleatorio entre el 5 y el 30
SELECT FLOOR(RANDOM()*26)+5;

--¿Cual es el número entero más cercano a 54,34? ¿Y a 54,54?
SELECT ROUND(54.34, 0);

--¿Cuanto es 4 elevado a 5?
SELECT POWER(4,5);

--Quiero conocer el nombre de la base de datos sobre la que estoy trabajando
SELECT CURRENT_DATABASE();

--Quiero conocer el nombre de usuario con el que estoy conectado
SELECT CURRENT_USER;

--Quiero conocer el puerto en el que está escuchando el servidor
SELECT INET_SERVER_PORT();

--Quiero conocer el archivo de log (donde se está guardando la actividad)
SELECT PG_CURRENT_LOGFILE();

---------------------------------------------------------------------------------
--De Secuencias
---------------------------------------------------------------------------------
--Crea la secuencia seq_01 que sea de números enteros, y que salte de 2 en 2
CREATE SEQUENCE seq_01 INCREMENT BY 2 START WITH 1;

--¿Cómo incluirías los valores de esta secuencia en un campo id?
id INTEGER DEFAULT NEXTVAL('seq_01')

--¿Cómo sabes cual es el valor actual de la secuencia? ¿Y el siguiente?
SELECT CURRVAL('seq_01');
SELECT NEXTVAL('seq_01');

--¿Cómo borras esa secuencia?
DROP SEQUENCE IF EXISTS seq_01;

---------------------------------------------------------------------------------
--De fecha y Transformación
---------------------------------------------------------------------------------
--¿Qué día es hoy?
SELECT CURRENT_DATE;

--¿Qué hora es?
SELECT CURRENT_TIME;

--¿En qué zona horaria está la base de datos?
SELECT CURRENT_SETTING('TIMEZONE');

--¿Qué sentencia tienes que construir para obtener “2001-07-27 12:00”, usando un intervalo de 3 días?
SELECT DATE '2001-07-24 00:00' + INTERVAL '3 days + 12:00';

--¿Cuantos años (y horas) tienes en este momento?
SELECT AGE(current_timestamp, timestamp '1990-12-08');

--¿Cuantas horas son desde las 07:30 a as 08:45? (usando time, claro)
SELECT TIME '08:45' - TIME '07:30';

--¿Qué diferencia, en días, hay entre el 1 de Enero de 1970 y el 15 de Julio de 2001?
SELECT DATE '2001-07-15' - DATE '1970-01-01';

--¿Y en años, meses y días?
SELECT AGE(TIMESTAMP '2001-07-15', TIMESTAMP '1970-01-01');

--¿En qué mes estamos hoy?
SELECT EXTRACT(MONTH FROM CURRENT_DATE);

--¿Cuales son los segundos, de la fecha 2001-02-16 20:38:40?
SELECT EXTRACT(SECOND FROM TIMESTAMP '2001-02-16 20:38:40');

--¿Qué hora, y segundos, son ahora?
SELECT LOCALTIME(0);

--¿Cómo es la fecha 05 Jan 2010, en formato ISO 8601?
SELECT TO_CHAR(TO_DATE('05 Jan 2010', 'DD Mon YYYY'), 'YYYY-MM-DD');

--¿Cómo hago para transformar el número 45670.78 en 45671?
SELECT ROUND(45670.78, 0);

--¿Cómo conviertes en cadena de texto el número real 345,56?
SELECT TO_CHAR(345.56::real, '999D99');

--¿Cómo conviertes el intervalo de «3 horas y 50 segundos» en una hora?
// TODO: no se hacerlo

---------------------------------------------------------------------------------
--De texto
---------------------------------------------------------------------------------
--¿Como concatenas, usando un operador, el valor “Hola, me llamo” y el nombre “Pepe”?
SELECT 'Hola, me llamo' || ' ' || 'Pepe';

--¿Como concatenas, usando una función, el valor “Hola, me llamo” y el nombre “Pepe”? ¿Qué ventajas tendría, frente a la opción anterior?
SELECT CONCAT('Hola, me llamo', ' ', 'Pepe');

--¿Cuantos caracteres tiene la cadena “Hola soy Pepe”?
SELECT CHAR_LENGTH('Hola soy Pepe');

--¿En qué posición está el caracter “y”?
SELECT POSITION('y' in 'Hola soy Pepe');

--¿Cómo harías para quitar las o’s y las e’s de “Hola soy Pepe”?
SELECT TRIM(both 'oe' from 'Hola soy Pepe');

--¿Cómo harías para poner todos los caracteres en minúscula?
SELECT LOWER('Hola soy Pepe');

--¿Y para extraer sólo los primeros cuatro caracteres?
SELECT SUBSTRING('Hola soy Pepe' for 4);

--¿Cómo extraerías las subcadena la?
SELECT SUBSTRING('Hola soy Pepe' from 3 for 2);

--¿Y las palabras separadas por espacios?
SELECT REGEXP_SPLIT_TO_ARRAY('Hola soy Pepe', ' ');

--Suponiendo la cadena “Pepe”, ¿como harías para mostrar “Hola Pepe, soy Pepe, Adiós Pepe”?
SELECT FORMAT('Hola %1$s, soy %1$s, Adiós %1$s', 'Pepe');