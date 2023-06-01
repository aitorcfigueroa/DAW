# Realiza las siguientes consultas en xquery con el fichero premios.xml (repositorio):
## (1 punto) Devuelve la frase "[nombre] ha ganado el premio de [categoria] en el año [año]"
````
for $x in doc("premios.xml")/premios_nobel/premios/premio 
return <premiado>{data($x/premiado)} ha ganado el premio de {data($x/@categoria)} en el año {data($x/año)}</premiado>
````
## (1 punto) Una tabla html [categoria] | [premiado] ordenada de mayor a menor por los [años]
````
<table>
  <tr>
    <th>Categoría</th>
    <th>Premiado</th>
  </tr>
  <tr>
    {
    for $x in doc("premios.xml")/premios_nobel/premios/premio
    order by $x/año descending
    return (<td>{data($x/@categoria)}</td>,<td>{data($x/premiado)}</td>)
    }
  </tr>
</table>
````
## (2 punto) Incluir un nuevo premiado en un nuevo fichero
````
insert node <premio categoria="nuevo">
            <año>2023</año>
            <premiado>Aitor Couñago</premiado>
            <motivo>¿Por qué no?</motivo>
        </premio>
into doc("premios.xml")/premios_nobel/premios
````
## (2 puntos) Realizar un fichero nuevo incluyendo motivos en los que no tienen
````
insert node <motivo>¿Por qué no?</motivo>
into doc("premios.xml")/premios_nobel/premios/premio
where $x/@categoria='literatura'
````

# Realiza una aplicación para usar el fichero employees.json (repositorio)
## (2 puntos) Que lea el fichero y guarde los datos en un array list
````
//Se importa el JSON
const data = require('./employees.json');

//Se convierte en una string solo los datos
const result = JSON.stringify(data.employees);

//Se convierte en un array
const array = JSON.parse(result);
````

## (2 puntos) Despues de modificar algun datos en el array list que lo vuelva a guardar
````
//Se importa el JSON
const data = require('./employees.json');

//Se convierte en una string solo los datos
const result = JSON.stringify(data.employees);

//Se convierte en un array
const array = JSON.parse(result);

//Se cambian los datos
array[0].firstName = "Aitor";
array[2].lastName = "Couñago";

//Se vuelve a convertir a JSON
const newJson = JSON.stringify({ employees: array });
````