USE [dbOds]
GO
/****** Object:  StoredProcedure [Facade].[uspCompareProperty]    Script Date: 19.09.2019 18:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[Facade].[uspCompareObjectSettings]', 'P') IS NOT NULL DROP PROCEDURE [Facade].[uspCompareObjectSettings]

GO
CREATE PROCEDURE [Facade].[uspCompareObjectSettings]
    (
        @ColumnName				NVARCHAR(255)
        , @LocalName				NVARCHAR(255)
        , @RemoteName				NVARCHAR(255)
        , @Server					NVARCHAR(255)
        , @ClassOrClassProperty   BIT
        )
    AS
    BEGIN
        DECLARE @LocalData       NVARCHAR(200)
            , @RemoteData      NVARCHAR(200)
            , @TableName	     NVARCHAR(200)
            , @sql			 NVARCHAR(1000)


        SET @TableName = CASE WHEN @ClassOrClassProperty = 0 THEN N'ObjectClass'
                              WHEN @ClassOrClassProperty = 1 THEN N'ObjectClassProperty'
            END


        SET @sql = N'SELECT @LocalData = ' + @ColumnName +  N' FROM [dbOds].[ydm].['+ @TableName + N'] WHERE _Name = ' + N'N''' + @LocalName + N''''
        exec sp_executesql @sql, @Params = N'@LocalData nvarchar(200) OUTPUT',  @LocalData = @LocalData OUTPUT

        SET @sql = N'SELECT @RemoteData = ' + @ColumnName +  N' FROM ' + @Server + N'[dbOds].[ydm].['+ @TableName + N'] WHERE _Name = ' + N'N''' + @RemoteName + N''''
        exec sp_executesql @sql, @Params = N'@RemoteData nvarchar(200) OUTPUT', @RemoteData = @RemoteData OUTPUT

        SELECT @LocalName
             , @ColumnName
             , @LocalData
             , @RemoteData
             , CASE WHEN ISNULL(REPLACE(@LocalData, N'NULL', N' '), N' ') = ISNULL(REPLACE(@RemoteData, N'NULL', N' '), N' ') THEN N'OK' ELSE N'ERROR' END
        RETURN
    END