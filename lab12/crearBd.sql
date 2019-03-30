/* Laboratorio 12 - A01703013 */

IF EXISTS 
(SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Materiales')
drop table Materiales
CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric(8,2)
)

IF EXISTS 
(SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Proveedores')
drop table Proveedores
CREATE TABLE Proveedores
(
  RFC char(13) NOT NULL,
  RazonSocial varchar(50)
)

IF EXISTS 
(SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Proyectos')
drop table Proyectos
CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)

IF EXISTS 
(SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Entregan')
drop table Entregan
CREATE TABLE Entregan
(
  Clave numeric(5) NOT NULL,
  RFC char(13) NOT NULL,
  Numero numeric(5) NOT NULL,
  Fecha datetime NOT NULL,
  Cantidad numeric(8,2)
)

BULK INSERT a1703013.a1703013.[Materiales]
   FROM 'e:\wwwroot\a1703013\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1703013.a1703013.[Proveedores]
   FROM 'e:\wwwroot\a1703013\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  
BULK INSERT a1703013.a1703013.[Proyectos]
   FROM 'e:\wwwroot\a1703013\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  
SET DATEFORMAT dmy
BULK INSERT a1703013.a1703013.[Entregan]
   FROM 'e:\wwwroot\a1703013\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
		 
      )