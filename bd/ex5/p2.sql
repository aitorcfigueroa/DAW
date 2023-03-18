/* LENGUAJE DML */

/* Dime un ejemplo de inserción de datos en acs_objects que tenga algunos campos */
INSERT INTO acs_objects (object_id, object_type, context_id, ) VALUES (1, 'ejemplo', 1,)

/* Dime un ejemplo de inserción de datos en acs_objects que tenga todos los campos de la tabla */
INSERT INTO acs_objects(object_id, object_type, title, package_id, context_id, creation_date, creation_user, creation_ip, security_inherit_p)
VALUES (1, 'ejemplo', 'titulo', null, 1, '1999-01-08 04:05:06', 1, '200.200.200.200', 't');

/* Cómo harías para actualizar "title" a "Ejemplo de título" para los object_id mayores de 100 */
UPDATE acs_objects SET title = 'Ejemplo de título' WHERE object_id > 100;

/* Cómo harías para borrar los registros modificados (modifying_ip) desde la IP 200.200.200.200 */
DELETE FROM acs_objects WHERE modifying_ip = '200.200.200.200';