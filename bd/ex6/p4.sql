-- Ver los valores nulos (si hay) en el campo start_station
SELECT * FROM trips WHERE start_station IS NULL;

-- Actualizar todos los valores de start_station, si tienen valores nulos, para que sean iguales al valor de end_station para ese registro.
UPDATE trips SET start_station = end_station WHERE start_station IS NULL;

-- Para arreglar este tema en el futuro, ¿qué instrucción de modificación DDL tendríamos que ejecutar?
    -- La instrucción a ejecutar sería NOT NULL, por ejemplo, una vez modificados los datos podríamos actualizar las restricciones de la columna:
ALTER TABLE trips ALTER COLUMN start_station SET NOT NULL;

-- Borra todos los registros que no tengan un valor conocido de birth_date?
DELETE FROM trips WHERE birth_date IS NULL;

-- Actualizar los valores nulos de bike_number para que tengan el valor B00000
UPDATE trips SET bike_number = 'B00000' WHERE bike_number IS NULL;
