-- Dime el nombre del cliente del pedido 10360
SELECT CustomerName FROM Customers AS c FULL JOIN Orders AS o ON c.CustomerID = o.CustomerID 
WHERE OrderID = 10360;

-- Dime el nombre completo de los clientes con los pedidos 10360, 10253 y 10440
SELECT CustomerName FROM Customers AS c FULL JOIN Orders AS o ON c.CustomerID = o.CustomerID 
WHERE OrderID IN (10360, 10253, 10440);

-- Dime las ciudades y número de pedidos de clientes en esa ciudad
SELECT City, COUNT(OrderID) AS NumPedidos 
FROM Orders AS o LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID 
GROUP BY City;

-- ¿Cuales son las ciudades desde las que hay más de 7 pedidos?
SELECT City, COUNT(OrderID) AS NumPedidos 
FROM Orders AS o LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID 
GROUP BY City HAVING NumPedidos > 7;

-- ¿Cuales son los tres países desde los que tengo más pedidos?
SELECT Country, COUNT(OrderID) AS NumPedidos 
FROM Orders AS o LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID 
GROUP BY Country ORDER BY NumPedidos DESC LIMIT 3;

-- Necesito un informe con el Nombre completo de los Empleados y el número de pedidos que registraron
SELECT ('El empleado ' || FirstName || ' ' || LastName || ' ha realidado ' || COUNT(OrderID) || ' pedidos.') AS Informe  
FROM Orders AS o LEFT JOIN Employees AS e ON o.EmployeeID = e.EmployeeID 
GROUP BY o.EmployeeID;

-- En el informe anterior, sólo necesito los empleados cuyo nombre comience por M
SELECT ('El empleado ' || FirstName || ' ' || LastName || ' ha realidado ' || COUNT(OrderID) || ' pedidos.') AS Informe  
FROM Orders AS o LEFT JOIN Employees AS e ON o.EmployeeID = e.EmployeeID 
GROUP BY o.EmployeeID HAVING FirstName LIKE 'M%';

-- Quiero saber el número de pedido, qué empleado (sólo el nombre) lo registró y el cliente.
SELECT OrderID AS NumPedido, FirstName AS Empleado, CustomerName AS Cliente 
FROM Orders AS o LEFT JOIN Employees AS e ON o.EmployeeID = e.EmployeeID LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID;

-- ¿Hay algún cliente que haya hecho más de un pedido registrado por el mismo empleado?
SELECT FirstName AS Empleado, CustomerName AS Cliente, COUNT(OrderID) AS NumPedidos
FROM Orders AS o LEFT JOIN Employees AS e ON o.EmployeeID = e.EmployeeID LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID
GROUP BY Empleado, Cliente HAVING NumPedidos > 1;

-- Quiero saber los clientes que hayan hecho más de un pedido y que hayan sido registrado por un Empleado cuyo nombre sea Margaret.

    -- Esta consulta nos daría como resultado una tabla con el Empleado, el Cliente y los pedidos realizados.
SELECT FirstName AS Empleado, CustomerName AS Cliente, COUNT(OrderID) AS NumPedidos
FROM Orders AS o LEFT JOIN Employees AS e ON o.EmployeeID = e.EmployeeID LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID
GROUP BY Empleado, Cliente HAVING NumPedidos > 1 AND Empleado LIKE 'Margaret';

    -- Esta Consulta nos daría como resultado solo los nombres de los Clientes que cumplen con las condiciones del enunciado.
SELECT CustomerName AS Cliente
FROM Orders AS o LEFT JOIN Employees AS e ON o.EmployeeID = e.EmployeeID LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID
GROUP BY FirstName, Cliente HAVING COUNT(OrderID) > 1 AND FirstName LIKE 'Margaret';