USE [dbOds]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Facade].[uspCompareObject]', 'P') IS NOT NULL DROP PROCEDURE [Facade].[uspCompareObject]

GO
CREATE PROCEDURE [Facade].[uspCompareObject]
    (
        @ObjectLocalName   NVARCHAR(255) = N'ZWebVariableConformanceScript'
        , @ObjectRemoteName  NVARCHAR(255) = N'ZWebVariableConformance'
        , @Server            NVARCHAR(255) = N'SERVER\INSTANCE'
        , @LocalServer	   BIT		     = 1
        , @FullCompare       BIT		     = 1
        )
    AS
    BEGIN

        DECLARE @ResultTable TABLE
                             ( Name               NVARCHAR(200)
                                 , ColumnName	       NVARCHAR(255)
                                 , LocalData	       NVARCHAR(200)
                                 , RemoteData	       NVARCHAR(200)
                                 , Result             NVARCHAR(20)
                             )

        DECLARE @ErrorTable TABLE
                            ( ClassProperty      NVARCHAR(200)
                                , PropertyName	   NVARCHAR(255)
                                , Errors             INT
                            )

        DECLARE @PropertyName      NVARCHAR(255)
            , @LocalProperty	   NVARCHAR(200)
            , @RemoteProperty	   NVARCHAR(200)
            , @LocalData	       NVARCHAR(200)
            , @RemoteData	       NVARCHAR(200)

        DECLARE @LocalRowCount	   INT
            , @RemoteRowCount	   INT

        DECLARE @sql			   NVARCHAR(4000)

        DECLARE @CONST_OBJECTCLASS         BIT = 0
            , @CONST_OBJECTCLASSPROPERTY BIT = 1
        --
--  Compare Class
-- 
        DELETE FROM @ResultTable

        IF @LocalServer = 0
            BEGIN
                BEGIN TRY
                    EXEC master.sys.sp_testlinkedserver @Server
                END TRY
                BEGIN CATCH
                    SELECT ERROR_NUMBER()  AS ErrorNumber
                         , ERROR_MESSAGE() AS ErrorMessage
                    RETURN
                END CATCH

                SET @Server = N'[' + @Server + N'].'
            END
        ELSE BEGIN
            SET @Server = N''
        END

        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassLocalName_U', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassLocalName_X', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassGlobalName_U', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassGlobalName_X', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ModelConventions_U', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ModelConventions_X', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Comment_U', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Comment_X', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DataBaseName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'SchemaName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'TableName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'PartitionColumnName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DeletionDateColumnName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DeletionOrder', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'KeyRangeStart', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'KeyRangeExtent', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasHistory', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasStagingTable', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'IsCacheable', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasNullEntity', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Has1stJob', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasLastJob', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasTimestamp', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasExternalSystem', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Has1stDeleteMark', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Has2ndDeleteMark', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasVersion', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'HasComment', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'NamingStyle', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'NoXU', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
                            INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'IsPublic', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_Key', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Comment', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassLocalName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassGlobalName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'FullQualifiedTableName', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'KeyRangeStopp', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ModelConventions', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_UserRightCreate', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_UserRightRead', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_UserRightUpdate', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS
        IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_UserRightDelete', @ObjectLocalName, @ObjectRemoteName , @Server, @CONST_OBJECTCLASS


        SELECT Name			 AS ClassName
             , ColumnName
             , LocalData
             , RemoteData
             , Result
        FROM @ResultTable

        SELECT 'Class: '         AS Name
             , @ObjectLocalName  AS LocalClass
             , @ObjectRemoteName  AS RemoteClass
             , COUNT(Result)     AS Errors
        FROM @ResultTable
        WHERE Result = N'ERROR'

        --
--  Compare Class property
--  
        SELECT @LocalRowCount = COUNT(_ObjectClassKey) FROM [ydm].[ObjectClassProperty] WHERE _Name LIKE @ObjectLocalName + N'.%'

        SET @sql = N'SELECT @RemoteRowCount = COUNT(_ObjectClassKey) FROM ' + @Server + N'[dbOds].[ydm].[ObjectClassProperty] WHERE _Name LIKE ''' + @ObjectRemoteName + N'.%'''
        EXEC sp_executesql @sql, @Params = N'@RemoteRowCount INT OUTPUT', @RemoteRowCount = @RemoteRowCount OUTPUT

        SELECT @LocalRowCount   AS LocalRowCount
             , @RemoteRowCount  AS RemoteRowCount

        DECLARE property_cursor CURSOR
            FOR SELECT _Name FROM [ydm].[ObjectClassProperty]
                WHERE _Name LIKE @ObjectLocalName + N'.%'

        OPEN property_cursor

        FETCH NEXT FROM property_cursor
            INTO @LocalProperty

        WHILE @@FETCH_STATUS = 0
            BEGIN

                DELETE FROM @ResultTable
                SET @PropertyName = RIGHT(@LocalProperty, CHARINDEX('.', REVERSE(@LocalProperty)) - 1)
                SET @RemoteProperty = @ObjectRemoteName + N'.' + @PropertyName

                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassPropertyLocalName_U', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassPropertyLocalName_X', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassPropertyGlobalName_U', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassPropertyGlobalName_X', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ModelConventions_U', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ModelConventions_X', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Comment_U', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Comment_X', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ColumnName', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'AllowNull', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'SpansNameSpace', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'NoXU', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DataKind', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DataFormat', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DataDefault', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DataConstraint', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'DataCompute', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_ObjectClassKey', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_ReferencedOcpKey', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                --IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ReferenceCascadeType', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_EnumerationLink', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_Name', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] '_Key', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                                    INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'Comment', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassPropertyLocalName', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ObjectClassPropertyGlobalName', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY
                IF @FullCompare = 1 INSERT INTO @ResultTable EXEC [Facade].[uspCompareObjectSettings] 'ModelConventions', @LocalProperty, @RemoteProperty, @Server, @CONST_OBJECTCLASSPROPERTY

                SELECT Name			 AS ClassPropertyName
                     , ColumnName
                     , LocalData
                     , RemoteData
                     , Result
                FROM @ResultTable

                SELECT 'Class property: '	 AS Name
                     , @LocalProperty		 AS ClassProperty
                     , @PropertyName		 AS PropertyName
                     , COUNT(Result)		 AS Errors
                FROM @ResultTable
                WHERE Result = N'ERROR'

                INSERT INTO @ErrorTable ( ClassProperty
                                        , PropertyName
                                        , Errors
                )
                VALUES( @LocalProperty
                      , @PropertyName
                      , (SELECT	COUNT(Result)FROM @ResultTable WHERE Result = N'ERROR'))


                FETCH NEXT FROM property_cursor
                    INTO @LocalProperty

            END

        SELECT * FROM @ErrorTable

        SELECT N'Compare result: ' AS Name
             , CASE
                   WHEN SUM(Errors) = 0 THEN 'PASSED'
                   ELSE 'FAILED'
            END AS Result
             , SUM(Errors) AS TotalErrors
        FROM @ErrorTable

    END