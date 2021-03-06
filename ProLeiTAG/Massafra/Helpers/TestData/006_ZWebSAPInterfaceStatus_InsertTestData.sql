Use dbOds
GO

DELETE FROM [Facade].[ZWebSAPInterfaceStatus]
GO

INSERT INTO [Facade].[ZWebSAPInterfaceStatus] (
  [_Key]
      ,[BatchName]
      ,[BatchProcessStartTime]
      ,[Brewline]
      ,[Comment]
      ,[CurrentStep]
      ,[ErrorPO]
      ,[ErrorPP]
      ,[ErrorQM]
      ,[IsComplete]
      ,[IsLocked]
      ,[MaterialGlobalName]
      ,[MaterialLocalName]
      ,[POFBReceived]
      ,[POSent]
      ,[PPFBReceived]
      ,[PPSent]
      ,[QMFBReceived]
      ,[QMSent]
      ,[SAPMaterial]
      ,[SAP_Batch]
      ,[SAP_PO]
      ,[StatusPO]
      ,[StatusPP]
      ,[StatusQM]
      ,[_BatchKey]
      ,[_MaterialKey]
)
SELECT TOP 100
       SIS.[_Key]
      ,SIS.[BatchName]
      ,SIS.[BatchProcessStartTime]
      ,SIS.[Brewline]
      ,SIS.[Comment]
      ,SIS.[CurrentStep]
      ,SIS.[ErrorPO]
      ,SIS.[ErrorPP]
      ,SIS.[ErrorQM]
      ,SIS.[IsComplete]
      ,SIS.[IsLocked]
      ,SIS.[MaterialGlobalName]
      ,SIS.[MaterialLocalName]
      ,SIS.[POFBReceived]
      ,SIS.[POSent]
      ,SIS.[PPFBReceived]
      ,SIS.[PPSent]
      ,SIS.[QMFBReceived]
      ,SIS.[QMSent]
      ,SIS.[SAPMaterial]
      ,SIS.[SAP_Batch]
      ,SIS.[SAP_PO]
      ,SIS.[StatusPO]
      ,SIS.[StatusPP]
      ,SIS.[StatusQM]
      ,SIS.[_BatchKey]
      ,SIS.[_MaterialKey]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebSAPInterfaceStatus] SIS
INNER JOIN [Facade].[ZWebBatchOverview] BO
	ON BO.BatchName = SIS.BatchName
INNER JOIN [Ods].[Batch] B
	ON B.BatchName = SIS.BatchName
GO

SELECT * FROM [Facade].[ZWebSAPInterfaceStatus]
