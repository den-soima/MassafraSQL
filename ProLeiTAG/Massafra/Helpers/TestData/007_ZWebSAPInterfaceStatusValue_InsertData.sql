Use dbOds
GO

DELETE
FROM [Facade].[ZWebSAPInterfaceStatusValue]
GO

INSERT INTO [Facade].[ZWebSAPInterfaceStatusValue] ( [_Key]
                                                   , [Comment]                           
                                                   , [Classifications]
                                                   , [SortOrder]
                                                   , [Format]
                                                   , [LowerLimit]
                                                   , [LowerVetoLimit]
                                                   , [DTORecordingTime]
                                                   , [RecordingTime]
                                                   , [SetpointValueRunning]
                                                   , [UnitOfMeasurement]
                                                   , [TargetUoM]
                                                   , [UpperLimit]
                                                   , [UpperVetoLimit]
                                                   , [Value]
                                                   , [ValueOriginal]
                                                   , [ValueString]
                                                   , [ValueStringOriginal]
                                                   , [_BatchKey]
                                                   , [_UnitKey]
                                                   , [UnitLocalName]
                                                   , [UnitGlobalName]
                                                   , [_ValueCategoryKey]
                                                   , [ValueCategoryLocalName]
                                                   , [ValueCategoryGlobalName]
                                                   , [_EnumerationLink]                                     
                                                   , [EnumerationTextLocalName]                                              
                                                   , [EnumerationTextGlobalName])
SELECT SISV.[_Key]
     , SISV.[Comment]
     , SISV.[Classifications]
     , SISV.[SortOrder]
     , SISV.[Format]
     , SISV.[LowerLimit]
     , SISV.[LowerVetoLimit]
     , SISV.[DTORecordingTime]
     , SISV.[RecordingTime]
     , SISV.[SetpointValueRunning]
     , SISV.[UnitOfMeasurement]
     , SISV.[TargetUoM]
     , SISV.[UpperLimit]
     , SISV.[UpperVetoLimit]
     , SISV.[Value]
     , SISV.[ValueOriginal]
     , SISV.[ValueString]
     , SISV.[ValueStringOriginal]
     , SISV.[_BatchKey]
     , SISV.[_UnitKey]
     , SISV.[UnitLocalName]
     , SISV.[UnitGlobalName]
     , SISV.[_ValueCategoryKey]
     , SISV.[ValueCategoryLocalName]
     , SISV.[ValueCategoryGlobalName]
     , SISV.[_EnumerationLink]
     , SISV.[EnumerationTextLocalName]
     , SISV.[EnumerationTextGlobalName]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebSAPInterfaceStatusValue] SISV
         INNER JOIN [Facade].[ZWebSAPInterfaceStatus] SIS
                    ON SIS._BatchKey = SISV._BatchKey
         INNER JOIN [Ods].ValueCategory VC
                    ON VC._Key = SISV._ValueCategoryKey
GO

SELECT *
FROM [Facade].[ZWebSAPInterfaceStatusValue]
