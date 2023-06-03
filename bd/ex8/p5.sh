# Trabajamos con la colección supplies de la BD sample_supplies

# Muéstrame 3 pedidos (supplies) de la BD.
db.sales.aggregate([ {$limit: 3}]);

# Muéstrame el promedio de edad de los clientes (customer) agrupado por tienda (storeLocation)
db.sales.aggregate([ {$group: {_id: "$storeLocation", avgClientAge: {$avg: "$customer.age"}}}])

# ¿Cuántos clientes mujeres de más de 40 años han hecho pedidos en nuestra tienda?
db.sales.aggregate([{$match: {"customer.gender": "F", "customer.age": {$gt: 40}}}, {$count: "Total"}])

# Muéstrame la tienda, el email del cliente y su edad, de los 5 pedidos con mejor valoración (satisfaction) de los clientes (customer)
db.sales.aggregate([{$sort: {"customer.satisfaction": -1}}, {$project: {storeLocation: 1, "customer.email": 1, "customer.age": 1, _id: 0}}, {$limit: 5}])