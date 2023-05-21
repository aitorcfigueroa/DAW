--Quiero crear un número aleatorio entre el 5 y el 30
SELECT FLOOR(RANDOM()*26)+5;

--¿Cuanto es 4 elevado a 5?
SELECT POWER(4,5);

--Crea la secuencia seq_01 que sea de números enteros, y que salte de 2 en 2
CREATE SEQUENCE seq_01 INCREMENT BY 2 START WITH 1;

--¿Cómo sabes cual es el valor actual de la secuencia? ¿Y el siguiente?
SELECT CURRVAL('seq_01');
SELECT NEXTVAL('seq_01');

--¿Qué sentencia tienes que construir para obtener “2001-07-27 12:00”, usando un intervalo de 3 días?
SELECT DATE '2001-07-24 00:00' + INTERVAL '3 days + 12:00';

--¿Cuantas horas son desde las 07:30 a as 08:45? (usando time, claro)
SELECT TIME '08:45' - TIME '07:30';

--¿Cuales son los segundos, de la fecha 2001-02-16 20:38:40?
SELECT EXTRACT(SECOND FROM TIMESTAMP '2001-02-16 20:38:40');

--¿Como concatenas, usando un operador, el valor “Hola, me llamo” y el nombre “Pepe”?
SELECT 'Hola, me llamo' || ' ' || 'Pepe';

--¿Cómo harías para quitar las o’s y las e’s de “Hola soy Pepe”?
SELECT TRIM(both 'oe' from 'Hola soy Pepe');
