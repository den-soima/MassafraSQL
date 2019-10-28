------------------------------------------------------------------------------------
--	 PlantiT Integrate class creating
------------------------------------------------------------------------------------
--
DECLARE @ClassName NVARCHAR(255) = N'ZBatchCockpitSAPConfiguration'
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
          , @ObjectClassLocalName      = N'Batch Cockpit SAP Configuration'
          , @ObjectClassGlobalName     = N'Batch Cockpit SAP Configuration'
          , @SchemaName                = N'Fo'
          , @TableName                 = @ClassName    
          , @KeyRangeStart             = 52000000000    --51000000000
          , @KeyRangeExtent            = 100000000
          , @HasHistory                = 0
          , @HasExtLink                = 0
          , @HasStagingTable           = 0
          , @IsCacheable               = 0
          , @Has1stDeleteMark          = 0
          , @Has2ndDeleteMark          = 1
          , @HasVersion                = 0
          , @HasComment                = 0
          , @NamingStyle               = 2
		  , @NoXU                      = 1
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
		  , @ColumnName					   = N'AddinType'
		  , @DataKind					   = N'[DataKind integer]'
          , @DataDefault                   = N'0'
		  , @ObjectClassPropertyLocalName  = N'AddinType'
		  , @ObjectClassPropertyGlobalName = N'AddinType'
		  , @ModelConventions              = N'{"PropertyName": "AddinType"}'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Filters'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'Filters'
		  , @ObjectClassPropertyGlobalName = N'Filters'
		  , @ModelConventions              = N'{"PropertyName": "Filters"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'MenuGroupId'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'MenuGroupId'
		  , @ObjectClassPropertyGlobalName = N'MenuGroupId'
		  , @ModelConventions              = N'{"PropertyName": "MenuGroupId"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Reports'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'Reports'
		  , @ObjectClassPropertyGlobalName = N'Reports'
		  , @ModelConventions              = N'{"PropertyName": "Reports"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Sequence'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'Sequence'
		  , @ObjectClassPropertyGlobalName = N'Sequence'
		  , @ModelConventions              = N'{"PropertyName": "Sequence"}'
		  , @AllowNull					   = 1
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Target'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'Target'
		  , @ObjectClassPropertyGlobalName = N'Target'
		  , @ModelConventions              = N'{"PropertyName": "Target"}'
		  , @AllowNull					   = 0
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
		  , @ReferencedOcpLink   = N'Enterprise._Key'
          , @NoXU                = 1
          , @AllowNull           = 0
          , @SpansNameSpace      = 1
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N'BatchCockpitConfiguration'
		  , @GeneratorFlags      = 12
		  , @ReferencedOcpLink   = N''
          , @NoXU                = 1
          , @AllowNull           = 0
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

                                                    
                                                         