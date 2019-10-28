------------------------------------------------------------------------------------
--	 PlantiT Integrate class creating
------------------------------------------------------------------------------------
--
DECLARE @ClassName NVARCHAR(255) = N'ZOPICalculation'
-- 
PRINT '-----------------------------------------------------------------------------'
PRINT 'Creating class: ' + @ClassName
PRINT '-----------------------------------------------------------------------------'
-- 
-- Debug:
DECLARE @Debug BIGINT = CASE WHEN ISNUMERIC(N'$(DebugCmd)') = 1  THEN  N'$(DebugCmd)' ELSE 1 END

-- Frontend view: 
DECLARE @ErrorNumber   BIGINT
DECLARE @ErrorText     NVARCHAR(200)
------------------------------------------------------------------------------------
--	 TRY
------------------------------------------------------------------------------------
BEGIN TRY
    BEGIN TRANSACTION CREATINGCLASS_TRANSACTION;    
------------------------------------------------------------------------------------
--	 ObjectClass property
------------------------------------------------------------------------------------
EXEC ydm.spObjectClassProvideByName
            @Name                      = @ClassName
          , @ObjectClassLocalName      = N'OPI Calculation'
          , @ObjectClassGlobalName     = N'OPI Calculation'
          , @SchemaName                = N'Ods'
          , @TableName                 = @ClassName    
          , @KeyRangeStart             = 990001800000000
          , @KeyRangeExtent            = 100000000
          , @HasHistory                = 0
          , @HasExtLink                = 0
          , @HasStagingTable           = 0
          , @IsCacheable               = 0
          , @Has1stDeleteMark          = 0
          , @Has2ndDeleteMark          = 0
          , @HasVersion                = 0
          , @HasComment                = 0
          , @NamingStyle               = -1
		  , @NoXU                      = 0
          , @Has1stJob                 = 0
          , @HasLastJob                = 0
          , @HasTimestamp              = 1
          , @ErrorNumber               = @ErrorNumber    OUTPUT
          , @ErrorText                 = @ErrorText      OUTPUT
		  , @Debug					   = @Debug
------------------------------------------------------------------------------------
--	 Class property
------------------------------------------------------------------------------------
EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'BrewsActual'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'BrewsActual'
		  , @ObjectClassPropertyGlobalName = N'BrewsActual'
		  , @ModelConventions              = N'{"PropertyName": "BrewsActual"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'CalculationDone'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'CalculationDone'
		  , @ObjectClassPropertyGlobalName = N'CalculationDone'
		  , @ModelConventions              = N'{"PropertyName": "CalculationDone"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'EndDate'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'EndDate'
		  , @ObjectClassPropertyGlobalName = N'EndDate'
		  , @ModelConventions              = N'{"PropertyName": "EndDate"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ExtLack'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ExtLack'
		  , @ObjectClassPropertyGlobalName = N'ExtLack'
		  , @ModelConventions              = N'{"PropertyName": "ExtLack"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ExtStrike'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ExtStrike'
		  , @ObjectClassPropertyGlobalName = N'ExtStrike'
		  , @ModelConventions              = N'{"PropertyName": "ExtStrike"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'MonthEfficacy'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'MonthEfficacy'
		  , @ObjectClassPropertyGlobalName = N'MonthEfficacy'
		  , @ModelConventions              = N'{"PropertyName": "MonthEfficacy"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'MonthEfficiency'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'MonthEfficiency'
		  , @ObjectClassPropertyGlobalName = N'MonthEfficiency'
		  , @ModelConventions              = N'{"PropertyName": "MonthEfficiency"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'MonthOpi'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'MonthOpi'
		  , @ObjectClassPropertyGlobalName = N'MonthOpi'
		  , @ModelConventions              = N'{"PropertyName": "MonthOpi"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Nona'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'Nona'
		  , @ObjectClassPropertyGlobalName = N'Nona'
		  , @ModelConventions              = N'{"PropertyName": "Nona"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'NotPlannedStop'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'NotPlannedStop'
		  , @ObjectClassPropertyGlobalName = N'NotPlannedStop'
		  , @ModelConventions              = N'{"PropertyName": "NotPlannedStop"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'NotPlannedStopAuto'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'NotPlannedStopAuto'
		  , @ObjectClassPropertyGlobalName = N'NotPlannedStopAuto'
		  , @ModelConventions              = N'{"PropertyName": "NotPlannedStopAuto"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'NotPlannedStopMan'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'NotPlannedStopMan'
		  , @ObjectClassPropertyGlobalName = N'NotPlannedStopMan'
		  , @ModelConventions              = N'{"PropertyName": "NotPlannedStopMan"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'OPIMaxTheoMon'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'OPIMaxTheoMon'
		  , @ObjectClassPropertyGlobalName = N'OPIMaxTheoMon'
		  , @ModelConventions              = N'{"PropertyName": "OPIMaxTheoMon"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'PlannedBrews'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'PlannedBrews'
		  , @ObjectClassPropertyGlobalName = N'PlannedBrews'
		  , @ModelConventions              = N'{"PropertyName": "PlannedBrews"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'PlannedDown'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'PlannedDown'
		  , @ObjectClassPropertyGlobalName = N'PlannedDown'
		  , @ModelConventions              = N'{"PropertyName": "PlannedDown"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ProgressiveEfficacy'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ProgressiveEfficacy'
		  , @ObjectClassPropertyGlobalName = N'ProgressiveEfficacy'
		  , @ModelConventions              = N'{"PropertyName": "ProgressiveEfficacy"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ProgressiveEfficiency'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ProgressiveEfficiency'
		  , @ObjectClassPropertyGlobalName = N'ProgressiveEfficiency'
		  , @ModelConventions              = N'{"PropertyName": "ProgressiveEfficiency"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ProgressiveOpi'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ProgressiveOpi'
		  , @ObjectClassPropertyGlobalName = N'ProgressiveOpi'
		  , @ModelConventions              = N'{"PropertyName": "ProgressiveOpi"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'StartDate'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'StartDate'
		  , @ObjectClassPropertyGlobalName = N'StartDate'
		  , @ModelConventions              = N'{"PropertyName": "StartDate"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Target'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'Target'
		  , @ObjectClassPropertyGlobalName = N'Target'
		  , @ModelConventions              = N'{"PropertyName": "Target"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Week'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'Week'
		  , @ObjectClassPropertyGlobalName = N'Week'
		  , @ModelConventions              = N'{"PropertyName": "Week"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'WeekEfficacy'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'WeekEfficacy'
		  , @ObjectClassPropertyGlobalName = N'WeekEfficacy'
		  , @ModelConventions              = N'{"PropertyName": "WeekEfficacy"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'WorkingDays'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'WorkingDays'
		  , @ObjectClassPropertyGlobalName = N'WorkingDays'
		  , @ModelConventions              = N'{"PropertyName": "WorkingDays"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Year'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'Year'
		  , @ObjectClassPropertyGlobalName = N'Year'
		  , @ModelConventions              = N'{"PropertyName": "Year"}'
		  , @DataCompute			       = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'AvailableTime'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'AvailableTime'
		  , @ObjectClassPropertyGlobalName = N'AvailableTime'
		  , @ModelConventions              = N'{"PropertyName": "AvailableTime"}'
		  , @DataCompute			       = N'((WorkingDays * 24) - (ExtLack + ExtStrike)) - Nona'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'BrewsNominal'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'BrewsNominal'
		  , @ObjectClassPropertyGlobalName = N'BrewsNominal'
		  , @ModelConventions              = N'{"PropertyName": "BrewsNominal"}'
		  , @DataCompute			       = N'(((WorkingDays * 24) - (ExtLack + ExtStrike)) - Nona) * Target'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ExtStop'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ExtStop'
		  , @ObjectClassPropertyGlobalName = N'ExtStop'
		  , @ModelConventions              = N'{"PropertyName": "ExtStop"}'
		  , @DataCompute			       = N'ExtLack + ExtStrike'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'MannedTime'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'MannedTime'
		  , @ObjectClassPropertyGlobalName = N'MannedTime'
		  , @ModelConventions              = N'{"PropertyName": "MannedTime"}'
		  , @DataCompute			       = N'(WorkingDays * 24) - (ExtLack + ExtStrike)'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'OPIMaxTheoWk'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'OPIMaxTheoWk'
		  , @ObjectClassPropertyGlobalName = N'OPIMaxTheoWk'
		  , @ModelConventions              = N'{"PropertyName": "OPIMaxTheoWk"}'
		  , @DataCompute			       = N'((WorkingDays * 24) - PlannedDown) / NULLIF((WorkingDays * 24),0)'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ProdTime'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'ProdTime'
		  , @ObjectClassPropertyGlobalName = N'ProdTime'
		  , @ModelConventions              = N'{"PropertyName": "ProdTime"}'
		  , @DataCompute			       = N'PlannedBrews * Target'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'WeekEfficiency'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'WeekEfficiency'
		  , @ObjectClassPropertyGlobalName = N'WeekEfficiency'
		  , @ModelConventions              = N'{"PropertyName": "WeekEfficiency"}'
		  , @DataCompute			       = N'BrewsActual/NULLIF(((((WorkingDays * 24) - (ExtLack + ExtStrike)) - Nona)-PlannedDown),0)/NULLIF(Target,0)'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'WeekOpi'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'WeekOpi'
		  , @ObjectClassPropertyGlobalName = N'WeekOpi'
		  , @ModelConventions              = N'{"PropertyName": "WeekOpi"}'
		  , @DataCompute			       = N'BrewsActual/NULLIF((((WorkingDays * 24) - (ExtLack + ExtStrike)) - Nona) * Target,0)'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug
------------------------------------------------------------------------------------
--	 SuperOrdinated class property
------------------------------------------------------------------------------------
--EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
--            @ObjectClassLink     = @ClassName
--		  , @ColumnNameStub      = N''
--		  , @GeneratorFlags      = 1
--		  , @ReferencedOcpLink   = N'ValueCategory._Key'
--          , @NoXU                = 1
--          , @AllowNull           = 0
--          , @ReferenceCascadeType= 2                      
--          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
--		  , @Debug = @Debug
------------------------------------------------------------------------------------
--	 Create table
------------------------------------------------------------------------------------
EXEC ydm.spObjectClassCreateTableByName 
		    @ClassName
		  , @ErrorNumber = @ErrorNumber OUTPUT
		  , @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug
------------------------------------------------------------------------------------
    COMMIT TRANSACTION CREATINGCLASS_TRANSACTION;
END TRY
------------------------------------------------------------------------------------
--	 CATCH
------------------------------------------------------------------------------------
BEGIN CATCH
    IF @@TRANCOUNT > 0
        BEGIN
            PRINT '>> ROLLING BACK'
            ROLLBACK TRANSACTION CREATINGCLASS_TRANSACTION;
        END
    
    IF @Debug = 1
    SELECT
        ERROR_NUMBER()      AS ErrorNumber,
        ERROR_SEVERITY()    AS ErrorSeverity,
        ERROR_STATE()       AS ErrorState,
        ERROR_PROCEDURE()   AS ErrorProcedure,
        ERROR_LINE()        AS ErrorLine,
        ERROR_MESSAGE()     AS ErrorMessage      

    PRINT 'ErrorN:         ' + CAST(ERROR_NUMBER()  AS NVARCHAR(10))
    PRINT 'ErrorMessage:   ' + CAST(ERROR_MESSAGE() AS NVARCHAR(MAX))
END CATCH    
GO
-- 
PRINT '-----------------------------------------------------------------------------'
PRINT '.....'
-- 

                                                    
                                                         