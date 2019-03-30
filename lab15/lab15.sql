select * from materiales 
Muestra de salida:
1000	Varilla 3/16	100.00
1010	Varilla 4/32	115.00
Num. de renglones: 44

select * from materiales
where clave=1000
1000	Varilla 3/16	100.00
Num. de renglones: 1

select clave,rfc,fecha from entregan
1000	AAAA800101   	1998-07-08 00:00:00.000
1000	AAAA800101   	1999-08-08 00:00:00.000
Num. de renglones: 132

select * from materiales,entregan
where materiales.clave = entregan.clave
1000	Varilla 3/16	100.00	1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00
1000	Varilla 3/16	100.00	1000	AAAA800101   	5019	1999-08-08 00:00:00.000	254.00
Num. de renglones: 132

Si algún material no ha se ha entregado ¿Aparecería en el resultado de esta consulta? 
No, no aparecería porque no se aceptan con cantidad 0

select * from entregan,proyectos
where entregan.numero < = proyectos.numero
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00	5000	Vamos Mexico
1200	EEEE800101   	5000	2000-03-05 00:00:00.000	177.00	5000	Vamos Mexico
Num. de renglones: 1188

(select * from entregan where clave=1450)
union
(select * from entregan where clave=1300)
1300	GGGG800101   	5005	2002-06-10 00:00:00.000	521.00
1300	GGGG800101   	5005	2003-02-02 00:00:00.000	457.00
Num. de renglones: 3

¿Cuál sería una consulta que obtuviera el mismo resultado sin usar el operador Unión? Compruébalo. 
SELECT * FROM entregan WHERE clave=1450 or clave=1300

(select clave from entregan where numero=5001)
intersect
(select clave from entregan where numero=5018)
1010
Num. de renglones: 1

(select * from entregan) 
minus 
(select * from entregan where clave=1000) 
ERROR
Num. de renglones: 0

Nuevamente, "minus" es una palabra reservada que no está definida en SQL Server, define una consulta que regrese el mismo resultado.
select * from Entregan WHERE Entregan.clave!=1000
1010	BBBB800101   	5001	2000-05-03 00:00:00.000	528.00
1010	BBBB800101   	5018	2000-11-10 00:00:00.000	667.00
Num. de renglones: 129

select * from entregan,materiales
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00	1000	Varilla 3/16	100.00
1000	AAAA800101   	5019	1999-08-08 00:00:00.000	254.00	1000	Varilla 3/16	100.00
Num. de renglones: 5808

¿Cómo está definido el número de tuplas de este resultado en términos del número de tuplas de entregan y de materiales? 
El resultado de las tuplas del producto cartesiano se obtiene del numero de tuplas en entegan * numero de tuplas en materiales.

Plantea ahora una consulta para obtener las descripciones de los materiales entregados en el año 2000. 
SELECT m.Descripcion
FROM Materiales m, Entregan e
WHERE m.Clave = e.Clave AND (e.Fecha >= 01/01/2000 OR e.Fecha < 01/01/2001)
Arena
Block
Num. de renglones: 132

¿Por qué aparecen varias veces algunas descripciones de material? 
Porque se entregaron más de una vez (cierto material).

Uso del calificador distinct 
SELECT DISTINCT m.Descripcion
FROM Materiales m, Entregan e
WHERE m.Clave = e.Clave AND (e.Fecha >= 01/01/2000 OR e.Fecha < 01/01/2001)
Arena
Block
Num. de renglones: 42

¿Qué resultado obtienes en esta ocasión? 
Se reduce el numero de tuplas.

Ordenamientos.

SELECT pr.numero, pr.denominacion, e.fecha, e.cantidad
FROM proyectos pr, entregan e
WHERE pr.numero=e.numero
ORDER BY numero asc, fecha desc
5000	Vamos Mexico	2002-03-12 00:00:00.000	382.00
5000	Vamos Mexico	2000-03-05 00:00:00.000	177.00
Num. de renglones: 132

SELECT * FROM Materiales where Descripcion LIKE 'Si%'
¿Qué resultado obtienes? 
1120	Sillar rosa	100.00
1130	Sillar gris	110.00
Num. de renglones: 2

Explica que hace el símbolo '%'.
Puede haber cualquier o cualesquiera caracteres después. 
¿Qué sucede si la consulta fuera : LIKE 'Si' ? 
No habrá materiales que se llamen Si.
¿Qué resultado obtienes? 
Nada
Explica a qué se debe este comportamiento. 
No hay materiales que se llamen Si.

DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;


¿Qué resultado obtienes de ejecutar el siguiente código? 
Imprime: ¿Que resultado obtienes? ¿¿¿??? 
¿Para qué sirve DECLARE? 
Sirve para declarar una varible.
¿Cuál es la función de @foo? 
Es el nombre de la variable.
¿Que realiza el operador SET? 
Asigna el valor a las variables.

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
AAAA800101   
AAAA800101   
Tuplas: 72
Interpretación: Te pide la que la primera letra esté entre A y D, luego puede seguir lo que sea.
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
BBBB800101   
BBBB800101   
Tuplas: 114
Interpretación: Te pide que la primera letra no sea A, luego puede seguir lo que sea.
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';
5016
5016
Tuplas: 14
Interpretación: El número tiene que contener 4 digitos en total y el último debe de ser 6.

SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Numero Between 5000 and 5010; 
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00
1010	BBBB800101   	5001	2000-05-03 00:00:00.000	528.00
Tuplas: 60

¿Cómo filtrarías rangos de fechas? 
Para filtrar por fechas solo pondria BETWEEN fecha1 AND fecha2

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
AAAA800101   	86.00	1999-01-12 00:00:00.000	5008
Tuplas: 16

¿Qué hace la consulta? 
Muestra RFC, Cantidad, Fecha, Numero de las entregas de número entre 5000 y 5010 cuya razón social empieze con La...
¿Qué función tiene el paréntesis ( ) después de EXISTS? 
Delimitar la subconsulta.

Tomando de base la consulta anterior del EXISTS, realiza el query que devuelva el mismo resultado, pero usando el operador IN 
SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND RFC
IN ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC])
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
AAAA800101   	86.00	1999-01-12 00:00:00.000	5008
Tuplas: 16

Tomando de base la consulta anterior del EXISTS, realiza el query que devuelva el mismo resultado, pero usando el operador NOT IN 
SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND RFC
NOT IN ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial NOT LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC])
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
CCCC800101   	582.00	2001-07-29 00:00:00.000	5002
Tuplas: 16

Realiza un ejemplo donde apliques algún operador : ALL, SOME o ANY. 
SELECT RFC, Cantidad
FROM Entregan
WHERE RFC = ANY
(SELECT RFC FROM Proveedores WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )
AAAA800101   	165.00
AAAA800101   	254.00
Tuplas: 36

¿Qué hace la siguiente sentencia? Explica por qué. 
SELECT TOP 2 * FROM Proyectos
5000	Vamos Mexico
5001	Aztecón
Tuplas: 2
Interpretación: Solo muestra las dos primeras tuplas del resultado del query.

¿Qué sucede con la siguiente consulta? Explica por qué. 
SELECT TOP Numero FROM Proyectos 
Interpretación: Hay un error porque no se indica cuántas tuplas quieres mostrar.

¿Qué consulta usarías para obtener el importe de las entregas es decir, el total en dinero de lo entregado, basado en la cantidad de la entrega y el precio del material y el impuesto asignado? 
SELECT m.clave, (m.costo*(m.porcentajeimpuesto/100)+1)*e.cantidad as importe
FROM entregan e,materiales m
WHERE e.clave=m.Clave
1000	495.0000000000
1000	762.0000000000
Tuplas: 132

CREATE VIEW Primeros2Proy (NumProy, DenProy)
AS SELECT TOP 2*FROM Proyectos
5000	Vamos Mexico
5001	Aztecón
Tuplas: 2

CREATE VIEW EmpiezanConAD (RFC)
AS SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%'
AAAA800101   
AAAA800101   
Tuplas: 72

CREATE VIEW EmpiezanSinA(RFC)
AS SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'
BBBB800101   
BBBB800101   
Tuplas: 114

CREATE VIEW AcabaEn6(Num)
AS SELECT Numero FROM Entregan WHERE Numero LIKE '___6'
5016
5016
Tuplas: 14

CREATE VIEW EntregasEntre(Num)
AS SELECT Numero FROM Entregan WHERE Numero Between 5000 and 5010
5000
5001
Tuplas: 60


Los materiales (clave y descripción) entregados al proyecto "México sin ti no estamos completos". 
SELECT e.clave, m.descripcion
FROM Entregan e, Materiales m, Proyectos p
WHERE e.Clave=m.clave AND p.Numero=e.Numero AND p.Denominacion = 'Mexico sin ti no estamos completos'
1030	Varilla 4/33
1230	Cemento 
1430	Pintura B1022
Tuplas: 3

Los materiales (clave y descripción) que han sido proporcionados por el proveedor "Acme tools". 
SELECT e.clave, m.descripcion
FROM entregan e, materiales m, Proveedores p
WHERE e.Clave=m.clave AND p.RFC=e.RFC
AND p.RazonSocial='Acme tools'
Tuplas: 0

El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales. 
SET dateformat dmy
SELECT p.RFC
FROM Entregan e, Proveedores p
WHERE p.RFC=e.RFC AND Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY p.RFC
HAVING AVG(cantidad)>=300
BBBB800101   	392.400000
CCCC800101   	372.000000
Tuplas: 7

El Total entregado por cada material en el año 2000. 
SET dateformat dmy
SELECT m.clave, sum(cantidad) as 'Total'
FROM entregan e, materiales m
WHERE e.Clave=m.Clave AND Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY m.Clave
1000	7.00
1010	1195.00
Tuplas: 22

La Clave del material más vendido durante el 2001. (se recomienda usar una vista intermedia para su solución) 
SELECT top 1 clave
FROM entregan
WHERE Fecha BETWEEN '01/01/2001' AND '31/12/2001'
ORDER BY cantidad desc
1100
Tuplas: 1

Productos que contienen el patrón 'ub' en su nombre. 
SELECT m.descripcion
FROM Materiales as m
WHERE Descripcion LIKE '%ub%'
Recubrimiento P1001
Recubrimiento P1010
Tuplas: 12

Denominación y suma del total a pagar para todos los proyectos. 
SELECT p.denominacion, sum((m.Costo+m.Costo*m.PorcentajeImpuesto/100)*cantidad) as 'Total'
FROM Entregan as e, Materiales as m, Proyectos as p
WHERE m.Clave=e.Clave AND p.numero=e.numero
GROUP BY p.Denominacion
Ampliación de la carretera a la huasteca	742461.1940000000
Aztecón	150200.2190000000
Tuplas: 20

Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acción que no se encuentran apoyando al proyecto Educando en Coahuila (Solo usando vistas). 
CREATE VIEW PTel
AS SELECT DISTINCT prov.RFC, prov.RazonSocial
FROM Proyectos p, Entregan e, Proveedores prov
WHERE p.Numero=e.Numero AND prov.RFC=e.RFC AND p.Denominacion='Televisa en acción'

CREATE VIEW PEdu
AS SELECT DISTINCT prov.RFC, prov.RazonSocial
FROM Proyectos p, Entregan e, Proveedores prov
WHERE p.Numero=e.Numero AND prov.RFC=e.RFC AND p.Denominacion='Educando en Coahuila'

CREATE VIEW PNoEdu
AS SELECT DISTINCT prov.RFC, prov.RazonSocial
FROM Proyectos p, Entregan e, Proveedores prov
WHERE p.Numero=e.Numero AND prov.RFC=e.RFC AND p.Denominacion!='Educando en Coahuila'

SELECT pt.RFC, pt.RazonSocial
FROM PTel pt
LEFT JOIN PEdu pe ON pe.RFC = pt.RFC
WHERE pe.RFC IS NULL
CCCC800101   	La Ferre
DDDD800101   	Cecoferre
Tuplas: 2

Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acción que no se encuentran apoyando al proyecto Educando en Coahuila (Sin usar vistas, utiliza not in, in o exists). 
SELECT DISTINCT p.denominacion, pr.RFC, pr.RazonSocial
FROM Entregan e, Proyectos p, Proveedores pr
WHERE p.numero=e.numero AND pr.RFC=e.RFC
AND p.Denominacion='Televisa en acción'
AND pr.RazonSocial not in (SELECT pr.RazonSocial
FROM Entregan e, proyectos p, Proveedores pr
WHERE p.numero=e.numero AND pr.RFC=e.RFC
AND p.Denominacion='Educando en Coahuila')
Televisa en acción	CCCC800101   	La Ferre
Televisa en acción	DDDD800101   	Cecoferre
Tuplas: 2

Costo de los materiales y los Materiales que son entregados al proyecto Televisa en acción cuyos proveedores también suministran materiales al proyecto Educando en Coahuila. 
SELECT m.costo, m.Descripcion
FROM Entregan e, Proyectos p, Proveedores pr, Materiales m
WHERE p.numero=e.numero AND pr.RFC=e.RFC AND m.Clave = e.clave AND p.Denominacion='Televisa en acción' AND pr.RFC IN
(SELECT pr.RFC
FROM Entregan e, proyectos p, Proveedores pr, Materiales m
WHERE p.numero=e.numero AND pr.RFC=e.RFC AND m.Clave = e.clave
AND p.Denominacion='Educando en Coahuila').Clave = e.clave
AND p.Denominacion='Educando en Coahuila')
50.00	Ladrillos rojos
34.00	Tepetate
Tuplas: 2

Nombre del material, cantidad de veces entregados y total del costo de dichas entregas por material de todos los proyectos. 
SELECT m.Descripcion, count(cantidad) as 'Cantidad de Veces Entregado',
SUM(cantidad*m.Costo+m.Costo*m.PorcentajeImpuesto/100) as 'Costo Total'
FROM Entregan e, Materiales m
WHERE m.Clave = e.clave
GROUP BY m.Descripcion
Arena	3	213414.88000000
Block	3	50641.98000000
Tuplas: 42
