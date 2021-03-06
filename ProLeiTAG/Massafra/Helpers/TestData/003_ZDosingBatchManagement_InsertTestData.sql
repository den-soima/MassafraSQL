Use dbOds
GO

DELETE FROM [Facade].[ZDosingBatchManagement]
GO

INSERT INTO [Facade].[ZDosingBatchManagement] (
       [_Key]
      ,[AlphaAcid]
      ,[BatchName]
      ,[Comment]
      ,[ValidSince]
      ,[_MaterialKey]
       )
SELECT TOP 100
       [_Key]
      ,[AlphaAcid]
      ,[BatchName]
      ,[Comment]
      ,[ValidSince]
      ,[_MaterialKey]
    FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZDosingBatchManagement]

GO

SELECT * FROM [Facade].[ZDosingBatchManagement]
