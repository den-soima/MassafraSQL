Use dbOds
GO

DELETE FROM [Facade].[ZFTRConfiguration]
GO

INSERT INTO [Facade].[ZFTRConfiguration] ( [_Key]                          
                                         , [Created]
                                         , [LastModified]
                                         , [HeaderInsertID]
                                         , [Position]
                                         , [_SelfReferenceKey]
                                         , [_ValueCategoryKey]
                                         , [_FTRHeaderKey]
                                         , [Comment])
SELECT [_Key]
     , [Created]
     , [LastModified]
     , [HeaderInsertID]
     , [Position]
     , [_SelfReferenceKey]
     , [_ValueCategoryKey]
     , [_FTRHeaderKey]
     , [Comment]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZFTRConfiguration]

GO

SELECT *
FROM [Facade].[ZFTRConfiguration]
