------------------------------------------------------------------------------------
--	 PlantiT Integrate class creating
------------------------------------------------------------------------------------
--
DECLARE @ClassName NVARCHAR(255) = N'ZWebExceptionReportData'
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
          , @ObjectClassLocalName      = N'Web Exception Report Data'
          , @ObjectClassGlobalName     = N'Web Exception Report Data'
          , @SchemaName                = N'Ods'
          , @TableName                 = @ClassName    
          , @KeyRangeStart             = 990001400000000
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
		  , @ColumnName					   = N'BatchName'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'BatchName'
		  , @ObjectClassPropertyGlobalName = N'BatchName'
		  , @ModelConventions              = N'{"PropertyName": "BatchName"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'BrewLine'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'BrewLine'
		  , @ObjectClassPropertyGlobalName = N'BrewLine'
		  , @ModelConventions              = N'{"PropertyName": "BrewLine"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'LowerLimit'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'LowerLimit'
		  , @ObjectClassPropertyGlobalName = N'LowerLimit'
		  , @ModelConventions              = N'{"PropertyName": "LowerLimit"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'LowerVetoLimit'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'LowerVetoLimit'
		  , @ObjectClassPropertyGlobalName = N'LowerVetoLimit'
		  , @ModelConventions              = N'{"PropertyName": "LowerVetoLimit"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'OutOfSpec'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'OutOfSpec'
		  , @ObjectClassPropertyGlobalName = N'OutOfSpec'
		  , @ModelConventions              = N'{"PropertyName": "OutOfSpec"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Setpoint'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'Setpoint'
		  , @ObjectClassPropertyGlobalName = N'Setpoint'
		  , @ModelConventions              = N'{"PropertyName": "Setpoint"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'SortOrder'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'SortOrder'
		  , @ObjectClassPropertyGlobalName = N'SortOrder'
		  , @ModelConventions              = N'{"PropertyName": "SortOrder"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'StartTime'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'StartTime'
		  , @ObjectClassPropertyGlobalName = N'StartTime'
		  , @ModelConventions              = N'{"PropertyName": "StartTime"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'UnitOfMeasurement'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'UnitOfMeasurement'
		  , @ObjectClassPropertyGlobalName = N'UnitOfMeasurement'
		  , @ModelConventions              = N'{"PropertyName": "UnitOfMeasurement"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'UpperLimit'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'UpperLimit'
		  , @ObjectClassPropertyGlobalName = N'UpperLimit'
		  , @ModelConventions              = N'{"PropertyName": "UpperLimit"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'UpperVetoLimit'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'UpperVetoLimit'
		  , @ObjectClassPropertyGlobalName = N'UpperVetoLimit'
		  , @ModelConventions              = N'{"PropertyName": "UpperVetoLimit"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Value'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'Value'
		  , @ObjectClassPropertyGlobalName = N'Value'
		  , @ModelConventions              = N'{"PropertyName": "Value"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'ValueString'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'ValueString'
		  , @ObjectClassPropertyGlobalName = N'ValueString'
		  , @ModelConventions              = N'{"PropertyName": "ValueString"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug
------------------------------------------------------------------------------------
--	 SuperOrdinated class property
------------------------------------------------------------------------------------
EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'Batch._Key'
          , @NoXU                = 1
          , @AllowNull           = 0
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'BatchType._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 13
		  , @ReferencedOcpLink   = N'Material._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 13
		  , @ReferencedOcpLink   = N'ValueCategory._Key'
          , @NoXU                = 1
          , @AllowNull           = 0
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'Value._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N'EnumerationText'
		  , @GeneratorFlags      = 12
		  , @ReferencedOcpLink   = N''
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug
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