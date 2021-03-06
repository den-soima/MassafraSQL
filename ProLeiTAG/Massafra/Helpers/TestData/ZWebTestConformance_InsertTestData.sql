Use dbOds
GO

DELETE FROM [Facade].[ZWebTestConformance]
GO

INSERT INTO [Facade].[ZWebTestConformance] (
  _Key
, [SortOrder]
, [StartTime]
, [ValueCategoryGlobalName]
, [ValueCategoryLocalName]
, [_BatchKey]
, [_BatchTypeKey]
, [_MaterialKey]
, [_ValueCategoryKey]
, [_ValueKey]
)
SELECT TOP 100 _Key
   , [SortOrder]
   , [StartTime]
   , [ValueCategoryGlobalName]
   , [ValueCategoryLocalName]
   , [_BatchKey]
   , [_BatchTypeKey]
   , [_MaterialKey]
   , [_ValueCategoryKey]
   , [_ValueKey]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebTestConformance]
ORDER BY StartTime DESC
GO

SELECT * FROM [Facade].[ZWebTestConformance]
