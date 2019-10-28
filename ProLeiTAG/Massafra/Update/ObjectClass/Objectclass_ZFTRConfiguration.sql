------------------------------------------------------------------------------------
--	 PlantiT Integrate class creating
------------------------------------------------------------------------------------
--
DECLARE @ClassName NVARCHAR(255) = N'ZFTRConfiguration'
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
          , @ObjectClassLocalName      = N'FTR Configuration'
          , @ObjectClassGlobalName     = N'FTR Configuration'
          , @SchemaName                = N'Ods'
          , @TableName                 = @ClassName    
          , @KeyRangeStart             = 990000800000000
          , @KeyRangeExtent            = 100000000
          , @HasHistory                = 0
          , @HasExtLink                = 0
          , @HasStagingTable           = 0
          , @IsCacheable               = 0
          , @Has1stDeleteMark          = 0
          , @Has2ndDeleteMark          = 0
          , @HasVersion                = 0
          , @HasComment                = 1
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
		  , @ColumnName					   = N'Created'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'Created'
		  , @ObjectClassPropertyGlobalName = N'Created'
		  , @ModelConventions              = N'{"PropertyName": "Created"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'LastModified'
		  , @DataKind					   = N'[DataKind timestamp]'		
		  , @ObjectClassPropertyLocalName  = N'LastModified'
		  , @ObjectClassPropertyGlobalName = N'LastModified'
		  , @ModelConventions              = N'{"PropertyName": "CreatedUser"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'HeaderInsertID'
		  , @DataKind					   = N'[DataKind character string]'		
		  , @ObjectClassPropertyLocalName  = N'HeaderInsertID'
		  , @ObjectClassPropertyGlobalName = N'HeaderInsertID'
		  , @ModelConventions              = N'{"PropertyName": "HeaderInsertID"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName  
			@ObjectClassLink               = @ClassName
		  , @ColumnName					   = N'Position'
		  , @DataKind					   = N'[DataKind integer]'		
		  , @ObjectClassPropertyLocalName  = N'Position'
		  , @ObjectClassPropertyGlobalName = N'Position'
		  , @ModelConventions              = N'{"PropertyName": "Position"}'
		  , @AllowNull					   = 0
		  , @NoXU						   = 1
		  , @ErrorNumber =  @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
          , @Debug = @Debug

EXEC ydm.spObjectClassPropertyProvideByName
            @ObjectClassLink               = @ClassName
          , @ColumnName					   = N'_SelfReferenceKey'
          , @DataKind					   = N'[DataKind integer]'
          , @ObjectClassPropertyLocalName  = N'_SelfReferenceKey'
          , @ObjectClassPropertyGlobalName = N'_SelfReferenceKey'
          , @ModelConventions              = N'{"PropertyName": "_SelfReferenceKey"}'
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
		  , @ReferencedOcpLink   = N'ValueCategory._Key'
          , @NoXU                = 1
          , @AllowNull           = 0
          , @ReferenceCascadeType= 2                      
          , @ErrorNumber = @ErrorNumber OUTPUT, @ErrorText = @ErrorText OUTPUT
		  , @Debug = @Debug

EXEC ydm.spObjectClassProvideSuperOrdinatedObjectAttributeByName
            @ObjectClassLink     = @ClassName
		  , @ColumnNameStub      = N'FTRHeader'
		  , @GeneratorFlags      = 1
		  , @ReferencedOcpLink   = N'ZFTRHeader._Key'
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

                                                    
                                                         