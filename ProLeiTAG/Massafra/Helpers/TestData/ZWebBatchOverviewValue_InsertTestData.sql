Use dbOds
GO

DELETE FROM [Facade].[ZWebBatchOverviewValue]
GO

INSERT INTO [Facade].[ZWebBatchOverviewValue] (
  _Key
, SortOrder
, Classifications
, Format
, LowerLimit
, LowerVetoLimit
, RecordingTime
, SetpointValueRunning
, TargetUoM
, UpperLimit
, UpperVetoLimit
, Value
, ValueString
, ValueOriginal
, ValueStringOriginal
, _BatchKey
, _ValueCategoryKey
, ValueCategoryLocalName
, ValueCategoryGlobalName
)
SELECT TOP 100
  BOV._Key
, BOV.SortOrder
, BOV.Classifications
, BOV.Format
, BOV.LowerLimit
, BOV.LowerVetoLimit
, BOV.RecordingTime
, BOV.SetpointValueRunning
, BOV.TargetUoM
, BOV.UpperLimit
, BOV.UpperVetoLimit
, BOV.Value
, BOV.ValueString
, BOV.ValueOriginal
, BOV.ValueStringOriginal
, BOV._BatchKey
, BOV._ValueCategoryKey
, BOV.ValueCategoryLocalName
, BOV.ValueCategoryGlobalName
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebBatchOverviewValue]  BOV
INNER JOIN [Facade].[ZWebBatchOverview] BO
ON BO._Key = BOV._BatchKey
GO

SELECT * FROM [Facade].[ZWebBatchOverviewValue]
