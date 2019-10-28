USE [dbOds]
GO
/****** Object:  StoredProcedure [Facade].[uspCompareProperty]    Script Date: 19.09.2019 18:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT type_desc, type FROM sys.procedures WITH(NOLOCK) WHERE name = 'uspCompareIdcHuddleValues' AND type = 'P')
     DROP PROCEDURE [Facade].[uspCompareIdcHuddleValues]
GO

CREATE PROCEDURE [Facade].[uspCompareIdcHuddleValues]
(
    @ValueKind  	NVARCHAR(20) = N'1 - Value' 
  , @SeqRecord      INT          = 3     
)
AS
BEGIN
	 ;WITH M (ValueType, ValueKind, ValueRecord, Value, ValueLocalName, ValueGlobalName, ValueExportClearance, 
	 ValueCategoryKey, ValueCategoryName) AS (
				  SELECT DISTINCT ValueType
	  				   , ValueKind
					   , ValueRecord
					   , Value
					   , ValueLocalName
					   , ValueGlobalName 
					   , ValueExportClearance	
					   , ValueCategoryKey				
					   , ValueCategoryName				
				  FROM ##MassafraDataTable 	
				  WHERE SeqRecord = @SeqRecord AND ValueKind = @ValueKind			  
				),
	          B (ValueType, ValueKind, ValueRecord, Value, ValueLocalName, ValueGlobalName, ValueExportClearance, 
	 ValueCategoryKey, ValueCategoryName) AS (
				  SELECT DISTINCT ValueType
	  				   , ValueKind
					   , ValueRecord
					   , Value
					   , ValueLocalName	
					   , ValueGlobalName 	
					   , ValueExportClearance 	
					   , ValueCategoryKey				
					   , ValueCategoryName	
				  FROM ##BergamoDataTable 
				  WHERE SeqRecord = @SeqRecord AND ValueKind =  @ValueKind AND ValueCategoryKey IS NOT NULL		 
	            )
	  SELECT @ValueKind	  AS ValueKind
	       , M.ValueCategoryKey
	       , M.ValueCategoryName
	       , M.Value
	  	   , M.ValueLocalName
		   , M.ValueGlobalName
		   , M.ValueExportClearance
		   , M.ValueRecord
		   , CASE WHEN M.ValueExportClearance = B.ValueExportClearance AND M.ValueRecord = B.ValueRecord THEN N'OK' ELSE N'ERROR' END AS Result	  
		   , B.ValueRecord
		   , B.ValueExportClearance
           , B.ValueCategoryKey
		   , B.ValueGlobalName
		   , B.ValueLocalName	
	       , B.Value
	       , B.ValueCategoryName           
		   FROM M
	  FULL JOIN B 
		ON B.ValueRecord = M.ValueRecord	
	  ORDER BY CASE WHEN B.ValueRecord IS NULL THEN 1 ELSE 0 END, B.ValueRecord ASC, M.ValueRecord ASC
END