-- Revisa las tablas Customers (clientes), Employees (empleados) y Orders (pedidos)
\d Customers
\d Employees
\d Orders

-- ¿Cuántos clientes hay registrados?
SELECT COUNT(*) FROM Customers;

-- ¿Cuántos pedidos?
SELECT COUNT(*) FROM Orders;

-- ¿Qué clientes viven en Londres y su nombre (CustomerName) empieza por A?
SELECT * FROM Customers WHERE City LIKE 'London' AND CustomerName LIKE 'A%';

-- ¿Cuántos clientes hay que son de Londres?
SELECT COUNT(*) FROM Customers WHERE City LIKE 'London';

-- ¿Cuántos clientes hay en cada ciudad?
SELECT City, COUNT(*) FROM Customers GROUP BY City;

-- ¿Cuántos empleados nacieron después de 1 de Junio del 1965?
SELECT COUNT(*) FROM Employees WHERE BirthDate > '1965-06-01';

-- Hazme un informe que diga «El empleado N nació el N», siendo N, nombre (FirstName y Last Name) y día de nacimiento (BirthDate)
SELECT ('El empleado ' || FirstName || ' ' || LastName || ' nació el ' || BirthDate) AS Informe 
FROM Employees;

-- Hazme el informe anterior, pero sólo para los empleados con id 8, 7, 3 y 10
SELECT ('El empleado ' || FirstName || ' ' || LastName || ' nació el ' || BirthDate) AS Informe 
FROM Employees WHERE EmployeeID IN (8,7,3,10);

-- Dime los paises que tengan más de 5 clientes, ordenados por el nombre de país
SELECT Country, COUNT(*) AS CustNum 
FROM Customers 
GROUP BY Country HAVING CustNum > 5 
ORDER BY Country ASC; -- En realidad no haría falta esta cláusula porque sin usarla ya viene ordenado por el nombre del país en ascendente.
