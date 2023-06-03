# Trabajamos sobre la colección restaurants de la BD sample_restaurants. En el archivo p3.sh dejas los comandos (las instrucciones).

#Los que sean de cocina griega (Greek). Sólo quiero saber el nombre, no toda la información
db.restaurants.find({cuisine: 'Greek'})

#Quiero un listado con el nombre de restaurante, el tipo de cocina y barrio (borough) en el que está
db.restaurants.find({}, {name: 1, cuisine: 1, borough: 1, _id: 0})

#Los que sean de cocina griega y tengan una nota (grade) de B. Solo el nombre y la nota.
db.restaurants.find({cuisine: 'Greek', "grades.grade": 'B'}, {name: 1, "grades.grade": 1, _id: 0})

#Los que hayan tenido una valoración (score) de al menos 30 puntos. Que apareza el nombre, el score y el barrio.
db.restaurants.find({$expr: { $gte: [ {$avg: "$grades.score"},  30]}}, {score: {$avg: "$grades.score"}, name: 1, borough: 1, _id: 0})

#Los que sean de cocina Italiana o Mexican y estén en Manhattan (borough). Que aparezca la calle, el edificio, el barrio, el tipo de cocina y grades (todas las valoraciones)
db.restaurants.find({cuisine: {$in: ["Italian", "Mexican"]}, borough: "Manhattan"}, {"address.street": 1, "address.building": 1, borough: 1, cuisine: 1, grades: 1, _id: 0})