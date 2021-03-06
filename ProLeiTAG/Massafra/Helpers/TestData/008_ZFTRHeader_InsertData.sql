Use dbOds
GO

DELETE FROM [Facade].[ZFTRHeader]
GO

INSERT INTO [Facade].[ZFTRHeader] ( [_Key]
                                  , [Comment]
                                  , [Created]
                                  , [CreatedUser]
                                  , [FTRGlobalName]
                                  , [FTRLocalName]
                                  , [InsertID]
                                  , [LastModified]
                                  , [LastModifiedUser])
SELECT [_Key]
     , [Comment]
     , [Created]
     , [CreatedUser]
     , [FTRGlobalName]
     , [FTRLocalName]
     , [InsertID]
     , [LastModified]
     , [LastModifiedUser]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZFTRHeader]

GO

SELECT *
FROM [Facade].[ZFTRHeader]
