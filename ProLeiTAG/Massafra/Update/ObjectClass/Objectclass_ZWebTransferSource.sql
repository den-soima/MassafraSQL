------------------------------------------------------------------------------------
--	 PlantiT Integrate class creating
------------------------------------------------------------------------------------
--
DECLARE @ClassName NVARCHAR(255) = N'ZWebTransferSource'
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
          , @ObjectClassLocalName      = N'Web Transfer Source'
          , @ObjectClassGlobalName     = N'Web Transfer Source'
          , @SchemaName                = N'Ods'
          , @TableName                 = @ClassName    
          , @KeyRangeStart             = 990000600000000
          , @KeyRangeExtent            = 100000000
          , @HasHistory                = 0
          , @HasExtLink                = 0
          , @HasStagingTable           = 0
          , @IsCacheable               = 0
          , @Has1stDeleteMark          = 0
          , @Has2ndDeleteMark          = 0
          , @HasVersion                = 0
          , @HasComment                = 1
          , @NamingStyle               = 0
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
		  , @ColumnName					   = N'ConfirmationState'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'ConfirmationState'
		  , @ObjectClassPropertyGlobalName = N'ConfirmationState'
		  , @ModelConventions              = N'{"PropertyName": "ConfirmationState"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'DestinationValueTimestamp'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'DestinationValueTimestamp'
		  , @ObjectClassPropertyGlobalName = N'DestinationValueTimestamp'
		  , @ModelConventions              = N'{"PropertyName": "DestinationValueTimestamp"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'EmptyFlag'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'EmptyFlag'
		  , @ObjectClassPropertyGlobalName = N'EmptyFlag'
		  , @ModelConventions              = N'{"PropertyName": "EmptyFlag"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'EndTime'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'EndTime'
		  , @ObjectClassPropertyGlobalName = N'EndTime'
		  , @ModelConventions              = N'{"PropertyName": "EndTime"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'SourceAmount'
		  , @DataKind					   = N'[DataKind floating point number]'		
		  , @ObjectClassPropertyLocalName  = N'SourceAmount'
		  , @ObjectClassPropertyGlobalName = N'SourceAmount'
		  , @ModelConventions              = N'{"PropertyName": "SourceAmount"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'SourceValueTimestamp'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'SourceValueTimestamp'
		  , @ObjectClassPropertyGlobalName = N'SourceValueTimestamp'
		  , @ModelConventions              = N'{"PropertyName": "SourceValueTimestamp"}'
		  , @DataCompute				   = N''
		  , @AllowNull					   = 0
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
          , @ColumnName					   = N'MaterialLocalName'
          , @DataKind					   = N'[DataKind character string]'
          , @ObjectClassPropertyLocalName  = N'MaterialLocalName'
          , @ObjectClassPropertyGlobalName = N'MaterialLocalName'
          , @ModelConventions              = N'{"PropertyName": "MaterialLocalName"}'
          , @DataCompute				   = N''
          , @AllowNull					   = 1
          , @NoXU						   = 1
          , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName
         @ObjectClassLink                = @ClassName
        , @ColumnName					 = N'MaterialGlobalName'
        , @DataKind					     = N'[DataKind character string]'
        , @ObjectClassPropertyLocalName  = N'MaterialGlobalName'
        , @ObjectClassPropertyGlobalName = N'MaterialGlobalName'
        , @ModelConventions              = N'{"PropertyName": "MaterialGlobalName"}'
        , @DataCompute				     = N''
        , @AllowNull					 = 1
        , @NoXU						     = 1
        , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
        , @Debug = @Debug
------------------------------------------------------------------------------------
--	 SuperOrdinated class property
------------------------------------------------------------------------------------
EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'Enterprise._Key'
          , @NoXU                = 1
          , @AllowNull           = 0
          , @SpansNameSpace      = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N'SourceMaterial'
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'Material._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N'SourceUnit'
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'Unit._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N'TransferBatch'
		  , @GeneratorFlags      = 16
		  , @ReferencedOcpLink   = N''
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
         @ObjectClassLink     = @ClassName
        , @ColumnNameStub      = N'TransferBatch'
        , @GeneratorFlags      = 1
        , @ReferencedOcpLink   = N'Batch._Key'
        , @NoXU                = 1
        , @AllowNull           = 1
        , @ReferenceCascadeType= 2
        , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
        , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'TransferType._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N''
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'TransferType._Key'
          , @NoXU                = 1
          , @AllowNull           = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
           @ObjectClassLink     = @ClassName
          , @ColumnNameStub      = N'SourceUnitOfMeasurement'
          , @GeneratorFlags      = 16
          , @ReferencedOcpLink   = N''
          , @NoXU                = 1
          , @AllowNull           = 0
          , @ReferenceCascadeType= 2
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

    EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
           @ObjectClassLink     = @ClassName
          , @ColumnNameStub      = N'Unit'
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

                                                    
                                                         