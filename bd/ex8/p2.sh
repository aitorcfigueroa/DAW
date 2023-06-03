#Diseña un almacén de datos que te permita gestionar y acceder a los datos de una aplicación de gestión de viajes sencilla. Se cumplirán los siguientes requisitos:

#Necesitamos conocer la información de los viajeros y los vuelos que hacen.
#Los viajeros son españoles o con residencia en España, y queremos saber el día que nacen para saber cual es su edad y felicitarle el cumpleaños. Un viajero puede hacer muchos viajes
#De los viajes queremos conocer de qué ciudad es el origen y cual es el destino, y claro la fecha (de salida y llegada). Ah! Y de cada ciudad queremos saber cuantos habitantes tiene y una descripción sencilla de 150 caracteres máximo con un recomendación de cosas para ver.
#Envíame en el archivo p2.sh (pongo la extensión .sh porque lo podría ejecutar esas instruccciones en mi consola mongosh) tu base de datos. Recuerda que no hay documento del modelo de datos (diseño físico) sino que se crea cuando insertas los datos. Necesito que cada colección tenga al menos 3 registros.

use viajeros

db.viajeros.insertMany([{
  nombre: "Pedro",
  nacionalidad: "Español",
  residencia: "España",
  fecha_nacimiento: "01/01/2000",
  viajes: [
    {
      origen: {
        nombre: "Vigo",
        habitantes: 500000,
        descripcion: "Es muy bonita"
      },
      destino: {
        nombre: "Madrid",
        habitantes: 1500000,
        descripcion: "Está muy poblada"
      },
      salida: "03/06/2023",
      llegada: "03/06/2023",
    }
  ]
}, {
  nombre: "Juan",
  nacionalidad: "Español",
  residencia: "España",
  fecha_nacimiento: "01/06/1990",
  viajes: [
    {
      origen: {
        nombre: "París",
        habitantes: 3000000,
        descripcion: "Tiene franceses"
      },
      destino: {
        nombre: "Roma",
        habitantes: 1500000,
        descripcion: "Tiene italianos"
      },
      salida: "05/06/2023",
      llegada: "05/06/2023",
    },{
      origen: {
        nombre: "Vigo",
        habitantes: 500000,
        descripcion: "Es muy bonita"
      },
      destino: {
        nombre: "Madrid",
        habitantes: 1500000,
        descripcion: "Está muy poblada"
      },
      salida: "03/06/2023",
      llegada: "03/06/2023",
    }
  ]
},{
  nombre: "Paula",
  nacionalidad: "Español",
  residencia: "España",
  fecha_nacimiento: "08/06/1990",
  viajes: [
    {
      origen: {
        nombre: "París",
        habitantes: 3000000,
        descripcion: "Tiene franceses"
      },
      destino: {
        nombre: "Roma",
        habitantes: 1500000,
        descripcion: "Tiene italianos"
      },
      salida: "05/06/2023",
      llegada: "05/06/2023",
    },{
      origen: {
        nombre: "Barcelona",
        habitantes: 500000,
        descripcion: "Es muy bonita"
      },
      destino: {
        nombre: "Madrid",
        habitantes: 1500000,
        descripcion: "Está muy poblada"
      },
      salida: "03/06/2023",
      llegada: "03/06/2023",
    },{
      origen: {
        nombre: "Londres",
        habitantes: 5000000,
        descripcion: "Llueve mucho"
      },
      destino: {
        nombre: "Madrid",
        habitantes: 1500000,
        descripcion: "Está muy poblada"
      },
      salida: "08/06/2023",
      llegada: "08/06/2023",
    }
  ]
}])


