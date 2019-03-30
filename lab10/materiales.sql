BULK INSERT a1703013.a1703013.[materiales]
   FROM 'e:\wwwroot\a1703013\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1703013.a1703013.[entregan]
   FROM 'e:\wwwroot\a1703013\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1703013.a1703013.[proveedores]
   FROM 'e:\wwwroot\a1703013\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1703013.a1703013.[proyectos]
   FROM 'e:\wwwroot\a1703013\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )