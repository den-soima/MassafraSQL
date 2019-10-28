Use dbOds
GO

DELETE FROM [Facade].[ZWebBrewBatch]
GO

INSERT INTO [Facade].[ZWebBrewBatch] (
                                       _Key
                                     , [BatchName]
                                     , [ConfirmationState]
                                     , [EndTime]
                                     , [OrderNumber]
                                     , [StartTime]
                                     , [_BatchTypeKey]
                                     , [_MaterialKey]
                                     , [_UnitKey]
)
SELECT
    ZWB._Key
     , ZWB.[BatchName]
     , ZWB.[ConfirmationState]
     , ZWB.[EndTime]
     , ZWB.[OrderNumber]
     , ZWB.[StartTime]
     , ZWB.[_BatchTypeKey]
     , ZWB.[_MaterialKey]
     , ZWB.[_UnitKey]
FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebBrewBatch] ZWB
         INNER JOIN [Facade].[Unit] U
                    ON U._Key = ZWB._UnitKey
WHERE YEAR(ZWB.StartTime) >= 2019

GO

SELECT * FROM [Facade].[ZWebBrewBatch]