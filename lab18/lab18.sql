-- La suma de las cantidades e importe total de todas las entregas realizadas durante el 97. 
SET DATEFORMAT dmy
SELECT SUM(e.Cantidad) as 'Cnt', SUM(m.Costo*e.Cantidad) as 'Importe Total'
FROM Entregan as e, Materiales as m
WHERE e.Clave = m.Clave AND e.Fecha >= '01/01/1997' AND e.Fecha <= '31/12/1997'

Outputs
Total 	Importe
546.00	43680.0000
Tuplas: 1

-- Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas. 
SELECT p.RazonSocial, COUNT(*) as 'Num entregas', SUM(m.Costo*e.Cantidad) as 'Importe total'
FROM Proveedores p, Entregan e, Materiales m
WHERE e.RFC=p.RFC AND e.Clave=m.Clave
GROUP BY p.RazonSocial

Outputs
RazonSocial	NumEntregas 	Importe
Alvin	15	776214.0000
Cecoferre	18	839275.0000
Tuplas: 8

-- Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400. 
SELECT m.Clave, m.Descripcion, SUM(e.Cantidad) as 'Total', MIN(e.Cantidad) as 'Min', MAX(e.Cantidad) as 'Max',  SUM(m.Costo*e.Cantidad) as 'Importe total'
FROM Materiales as m, Entregan as e
WHERE m.Clave=e.Clave
GROUP BY m.Clave, m.Descripcion
HAVING AVG(e.Cantidad) > 400

Outputs
Clave 	Descripcion		Total 	Min 	Max 	Importe total
1010	Varilla 4/32	1718.00	523.00	667.00	197570.0000
1040	Varilla 3/18	1349.00	263.00	546.00	215840.0000
Tuplas: 15

-- Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500.
SELECT p.RazonSocial, AVG(e.Cantidad) as 'Avg', m.Clave, m.Descripcion
FROM Proveedores as p, Materiales as m, Entregan as e
WHERE p.RFC=e.RFC AND m.Clave=e.Clave
GROUP BY p.RazonSocial, m.Clave, m.Descripcion
HAVING  AVG(e.Cantidad) > 500

Outputs
RazonSocial 	Avg 	Clave 	Descripcion
Oviedo	572.666666	1010	Varilla 4/32
La Ferre	562.666666	1100	Block
Tuplas: 3

-- Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450.
SELECT p.RazonSocial, AVG(e.Cantidad) as 'Avg', m.Clave, m.Descripcion
FROM Proveedores as p, Materiales as m, Entregan as e
WHERE p.RFC=e.RFC AND m.Clave=e.Clave
GROUP BY p.RazonSocial, m.Clave, m.Descripcion
HAVING  AVG(e.Cantidad) < 370 or  AVG(e.Cantidad) > 450
ORDER BY AVG(e.Cantidad) ASC

Outputs
RazonSocial 	Avg 	Clave 	Descripcion
La fragua	142.000000	1000	Varilla 3/16
Comex	197.333333	1210	Recubrimiento P1028
Tuplas: 34

-- Inserta cinto nuevos materiales
INSERT INTO Materiales VALUES (1440, 'Pintura Berel', 200.00, 2.20)
INSERT INTO Materiales VALUES (1450, 'Pintura Osel', 210.00, 2.20)
INSERT INTO Materiales VALUES (1460, 'Pintura Comex', 220.00, 2.20)
INSERT INTO Materiales VALUES (1470, 'Pintura Berel2', 230.00, 2.20)
INSERT INTO Materiales VALUES (1480, 'Pintura HomeDepot', 240.00, 2.20)

-- Clave y descripción de los materiales que nunca han sido entregados. 
SELECT m.Descripcion, m.Clave
FROM Materiales as m
WHERE m.Clave
NOT IN(
  SELECT e.Clave
  FROM Entregan as e
        )

Outputs
Descripcion	 	Clave
Pintura Berel	1440
Pintura Osel	1450

Tuplas: 5

-- Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'. 
SELECT DISTINCT p.RazonSocial
FROM Proveedores p, Entregan e, Proyectos pr
WHERE p.RFC=e.RFC AND pr.Numero=e.Numero AND pr.Denominacion='Vamos Mexico' AND p.RFC IN (
  SELECT p2.RFC
  FROM Proveedores p2, Entregan e2, Proyectos pr2
  WHERE p2.RFC=e2.RFC AND pr2.Numero=e2.Numero AND pr2.Denominacion='Queretaro Limpio'
  )

Tuplas: 0

--  Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.
SELECT m.Descripcion
FROM Materiales as m
WHERE m.Clave
NOT IN(
  SELECT e.Clave
  FROM Entregan as e, Proyectos as p
  WHERE e.Numero = p.Numero AND p.Denominacion = 'CIT Yucatan'
        )

Outputs
Descripcion
Varilla 3/16
Varilla 4/32

Tuplas: 45

-- Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'. 
SELECT p.RazonSocial, AVG(e.Cantidad) as 'Promedio'
FROM Proveedores as p, Entregan as e
WHERE p.RFC = e.RFC
GROUP BY p.RazonSocial
HAVING AVG(e.Cantidad) > (
  SELECT AVG(e2.Cantidad)
  FROM Entregan as e2
  WHERE e2.RFC='VAGO780901'
  )

Outputs
Alvin	359.333333
Cecoferre	335.500000

Tuplas: 8

Para probar se insertaron las siguientes tuplas:
INSERT INTO Proveedores values('VAGO780901', 'Prueba')
INSERT INTO Entregan values(1000,'VAGO780901', 5000, '1998-07-08 00:00:00.000', 165.00)
INSERT INTO Entregan values(1010,'VAGO780901', 5000, '1998-08-08 00:00:00.000', 1.00)
INSERT INTO Entregan values(1010,'VAGO780901', 5000, '1998-07-08 00:00:00.000', 700.00)

-- RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001.
SET DATEFORMAT dmy
SELECT p.RFC, p.RazonSocial
FROM Proveedores as p, Entregan as e, Proyectos as pr
WHERE p.RFC=e.RFC AND pr.Numero = e.Numero AND pr.Denominacion='Infonavit Durango'
GROUP BY p.RFC, p.RazonSocial
HAVING (
         SELECT SUM(e2.Cantidad)
         FROM Entregan as e2
         WHERE e2.Fecha >= '01/01/2000' AND e2.Fecha <= '31/12/2000' AND e2.RFC=p.RFC
       )>(
        SELECT SUM(e3.Cantidad)
         FROM Entregan as e3
         WHERE e3.Fecha >= '01/01/2001' AND e3.Fecha <= '31/12/2001' AND e3.RFC=p.RFC
         )

RFC				RazonSocial
BBBB800101    Oviedo
FFFF800101    Comex

Tuplas: 2

