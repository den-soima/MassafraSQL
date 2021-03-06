Use dbOds
GO

DELETE FROM [Facade].[ZWebBatchOverview]
GO

INSERT INTO [Facade].[ZWebBatchOverview] (
       [_Key]
      ,[BatchName]
      ,[BrewLine]
      ,[Comment]
      ,[ConfirmationState]
      ,[CurrentStep]
      ,[MaterialGlobalName]
      ,[MaterialLocalName]
      ,[ProcessStartTime]
      ,[SAPMaterial]
      ,[SAP_Batch]
      ,[SAP_PO]
      ,[_MaterialKey]
)
SELECT TOP 200
       BO.[_Key]
      ,BO.[BatchName]
      ,BO.[Brewline]
      ,BO.[Comment]
      ,BO.[ConfirmationState]
      ,BO.[CurrentStep]
      ,BO.[MaterialGlobalName]
      ,BO.[MaterialLocalName]
      ,BO.[ProcessStartTime]
      ,BO.[SAPMaterial]
      ,BO.[SAP_Batch]
      ,BO.[SAP_PO]
      ,BO.[_MaterialKey]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebBatchOverview] BO
INNER JOIN [Ods].[Batch] B
	ON B.BatchName = BO.BatchName
WHERE YEAR(BO.ProcessStartTime) >= 2019

GO

SELECT * FROM [Facade].[ZWebBatchOverview]
