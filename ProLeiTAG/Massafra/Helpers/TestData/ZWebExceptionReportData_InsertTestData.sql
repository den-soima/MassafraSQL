Use dbOds
GO

DELETE FROM [Facade].[ZWebExceptionReportData]
GO

INSERT INTO [Facade].[ZWebExceptionReportData] (
	   [_Key]
      ,[BatchName]
      ,[BrewLine]
      ,[EnumerationTextGlobalName]
      ,[EnumerationTextLocalName]
      ,[LowerLimit]
      ,[LowerVetoLimit]
      ,[MaterialGlobalName]
      ,[MaterialLocalName]
      ,[OutOfSpec]
      ,[Setpoint]
      ,[SortOrder]
      ,[StartTime]
      ,[UnitOfMeasurement]
      ,[UpperLimit]
      ,[UpperVetoLimit]
      ,[Value]
      ,[ValueCategoryGlobalName]
      ,[ValueCategoryLocalName]
      ,[ValueString]
      ,[_BatchKey]
      ,[_BatchTypeKey]
      ,[_MaterialKey]
      ,[_ValueCategoryKey]
      ,[_ValueKey]
)
SELECT TOP 100
       ERD.[_Key]
      ,ERD.[BatchName]
      ,ERD.[BrewLine]
      ,ERD.[EnumerationTextGlobalName]
      ,ERD.[EnumerationTextLocalName]
      ,ERD.[LowerLimit]
      ,ERD.[LowerVetoLimit]
      ,ERD.[MaterialGlobalName]
      ,ERD.[MaterialLocalName]
      ,ERD.[OutOfSpec]
      ,ERD.[Setpoint]
      ,ERD.[SortOrder]
      ,ERD.[StartTime]
      ,ERD.[UnitOfMeasurement]
      ,ERD.[UpperLimit]
      ,ERD.[UpperVetoLimit]
      ,ERD.[Value]
      ,ERD.[ValueCategoryGlobalName]
      ,ERD.[ValueCategoryLocalName]
      ,ERD.[ValueString]
      ,ERD.[_BatchKey]
      ,ERD.[_BatchTypeKey]
      ,ERD.[_MaterialKey]
      ,ERD.[_ValueCategoryKey]
      ,ERD.[_ValueKey]
FROM  [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebExceptionReportData] ERD
INNER JOIN [Ods].[Batch] B
ON B._Key = ERD._BatchKey
ORDER BY StartTime DESC
GO

SELECT * FROM [Facade].[ZWebExceptionReportData]
