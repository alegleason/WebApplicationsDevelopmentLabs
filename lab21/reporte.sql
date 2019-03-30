IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO

            CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO

  EXECUTE creaMaterial 5000,'Martillos Acme',250,15

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaMaterial' AND type = 'P')
                DROP PROCEDURE modificaMaterial
            GO

            CREATE PROCEDURE modificaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                UPDATE Materiales SET Descripcion = @udescripcion, Costo = @ucosto, PorcentajeImpuesto = @uimpuesto WHERE Clave = @uclave;

            GO

  EXECUTE modificaMaterial 1480, 'Pintura Carmex', 215.00, 2.00

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaMaterial' AND type = 'P')
                DROP PROCEDURE eliminaMaterial
            GO

            CREATE PROCEDURE eliminaMaterial
                @uclave NUMERIC(5,0)
            AS
              DELETE FROM Materiales WHERE Clave = @uclave;
            GO

  EXECUTE eliminaMaterial 1470

    --Desarrollar los procedimientos (almacenados) creaProyecto , modificaproyecto y eliminaproyecto, hacer lo mismo para las tablas proveedores y entregan.

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyecto' AND type = 'P')
                DROP PROCEDURE creaProyecto
            GO

            CREATE PROCEDURE creaProyecto
                @unumero NUMERIC(5),
                @udenominacion VARCHAR(50)
            AS
                INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
            GO

  EXECUTE creaProyecto 5020,'Tren Maya'

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProyecto' AND type = 'P')
                DROP PROCEDURE modificaProyecto
            GO

            CREATE PROCEDURE modificaProyecto
                @unumero NUMERIC(5),
                @udenominacion VARCHAR(50)
            AS
                UPDATE Proyectos SET Denominacion = @udenominacion WHERE Numero = @unumero;

            GO

  EXECUTE modificaProyecto 5020, 'Aeropuerto Santa Anita'

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProyecto' AND type = 'P')
                DROP PROCEDURE eliminaProyecto
            GO

            CREATE PROCEDURE eliminaProyecto
                @unumero NUMERIC(5)
            AS
              DELETE FROM Proyectos WHERE Numero = @unumero;
            GO

  EXECUTE eliminaProyecto 5020

-- Proveedores

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedor' AND type = 'P')
                DROP PROCEDURE creaProveedor
            GO

            CREATE PROCEDURE creaProveedor
                @urfc CHAR(13),
                @urazonsocial VARCHAR(50)
            AS
                INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
            GO

  EXECUTE creaProveedor 'GEMA980406GL0','Sunglasses Qro'

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProveedor' AND type = 'P')
                DROP PROCEDURE modificaProveedor
            GO

            CREATE PROCEDURE modificaProveedor
                @urfc CHAR(13),
                @urazonsocial VARCHAR(50)
            AS
                UPDATE Proveedores SET RazonSocial = @urazonsocial WHERE RFC = @urfc;
            GO

  EXECUTE modificaProveedor 'GEMA980406GL0', 'Bimbo'

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProveedor' AND type = 'P')
                DROP PROCEDURE eliminaProveedor
            GO

            CREATE PROCEDURE eliminaProveedor
                @urfc CHAR(13)
            AS
              DELETE FROM Proveedores WHERE RFC = @urfc;
            GO

  EXECUTE eliminaProveedor 'GEMA980406GL0'

-- Entregan


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaEntrega' AND type = 'P')
                DROP PROCEDURE creaEntrega
            GO

            CREATE PROCEDURE creaEntrega
                @uclave NUMERIC(5),
                @urfc CHAR(13),
                @unumero NUMERIC(5),
                @ufecha DATETIME,
                @ucantidad NUMERIC(8,2)
            AS
                INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha, @ucantidad)
            GO

  SET DATEFORMAT dmy
  EXECUTE creaEntrega 1440,'DDDD800101', 5007, '06/06/2005', 506

  IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaEntrega' AND type = 'P')
                DROP PROCEDURE modificaEntrega
            GO

            CREATE PROCEDURE modificaEntrega
                @uclave NUMERIC(5),
                @ucantidad NUMERIC(8,2)
            AS
                UPDATE Entregan SET Cantidad = @ucantidad WHERE Clave = @uclave;

            GO

  EXECUTE modificaEntrega 1440, 13

    IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaEntrega' AND type = 'P')
            DROP PROCEDURE eliminaEntrega
            GO

    CREATE PROCEDURE eliminaEntrega
        @uclave NUMERIC(5,0),
        @urfc CHAR(13),
        @unumero NUMERIC(5),
        @ufecha DATETIME
    AS
        DELETE FROM Entregan WHERE Clave=@uclave AND RFC=@urfc AND Numero=@unumero AND Fecha=@ufecha
    GO

      SET DATEFORMAT dmy
      EXECUTE eliminaEntrega 1430,'DDDD800101',5007,'09/01/1998'

  IF EXISTS (SELECT name FROM sysobjects
                                       WHERE name = 'queryMaterial' AND type = 'P')
                                DROP PROCEDURE queryMaterial
                            GO

                            CREATE PROCEDURE queryMaterial
                                @udescripcion VARCHAR(50),
                                @ucosto NUMERIC(8,2)

                            AS
                                SELECT * FROM Materiales WHERE descripcion
                                LIKE '%'+@udescripcion+'%' AND costo > @ucosto
                            GO

  EXECUTE queryMaterial 'Lad',20