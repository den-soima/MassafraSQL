USE [dbOds]
GO
/****** Object:  StoredProcedure [Facade].[uspCompareProperty]    Script Date: 19.09.2019 18:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT type_desc, type FROM sys.procedures WITH(NOLOCK) WHERE name = 'uspCompareIdcHuddleValuesProp' AND type = 'P')
     DROP PROCEDURE [Facade].[uspCompareIdcHuddleValuesProp]
GO

CREATE PROCEDURE [Facade].[uspCompareIdcHuddleValuesProp]
(
    @ValueKind  	NVARCHAR(20) = N'7 - Report' 
  , @SeqRecord      INT          = 3
  , @StepNumber     INT          = 2    
)
AS
BEGIN
	 ;WITH M (ValueType, ValueKind, ValueRecord, Value, ValueLocalName, ValueGlobalName, ValueExportClearance, 
	 OperationLocalName, OperationGlobalName, StepNumber, ValueCategoryKey, ValueCategoryName) AS (
				  SELECT DISTINCT ValueType
	  				   , ValueKind
					   , ValueRecord
					   , Value
					   , ValueLocalName
					   , ValueGlobalName 
					   , ValueExportClearance
					   , OperationLocalName 
					   , OperationGlobalName
					   , StepNumber			   	
					   , ValueCategoryKey				
					   , ValueCategoryName					
				  FROM ##MassafraDataTable 	
				  WHERE SeqRecord = @SeqRecord AND StepNumber = @StepNumber			  
				),
	          B (ValueType, ValueKind, ValueRecord, Value, ValueLocalName, ValueGlobalName, ValueExportClearance, 
	          OperationLocalName, OperationGlobalName, StepNumber, ValueCategoryKey, ValueCategoryName) AS (
				  SELECT DISTINCT ValueType
	  				   , ValueKind
					   , ValueRecord
					   , Value
					   , ValueLocalName	
					   , ValueGlobalName 	
					   , ValueExportClearance 	
					   , OperationLocalName 
					   , OperationGlobalName 
					   , StepNumber			
					   , ValueCategoryKey				
					   , ValueCategoryName	
				  FROM ##BergamoDataTable 
				  WHERE SeqRecord = @SeqRecord AND StepNumber = @StepNumber AND ValueCategoryKey IS NOT NULL 			 
	            )
	  SELECT M.StepNumber - 1    AS StepNumber
	       , M.OperationLocalName
		   , M.OperationGlobalName
		   , M.ValueKind
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
		   , B.ValueKind
		   , B.OperationLocalName
		   , B.OperationGlobalName
		   , B.ValueCategoryName
	       , B.Value
		   , B.StepNumber - 1    AS StepNumber
		   FROM M
	  FULL JOIN B 
		 ON B.ValueRecord = M.ValueRecord
		AND B.ValueKind = M.ValueKind	
	  ORDER BY CASE WHEN B.StepNumber IS NULL THEN 1 ELSE 0 END
             , B.ValueKind ASC
             , B.ValueRecord ASC
	         , M.StepNumber ASC
	         , M.ValueKind ASC
	         , M.OperationLocalName ASC
             
             
END