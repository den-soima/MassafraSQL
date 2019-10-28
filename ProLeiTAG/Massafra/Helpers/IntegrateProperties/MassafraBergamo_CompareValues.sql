USE [dbOds]
GO
--------------------------------------------------------------------------------------------------------------------------
--    User compare parameters
--------------------------------------------------------------------------------------------------------------------------
DECLARE @RecipeKeyMassafra			   NVARCHAR(20) = N'99RP'
DECLARE @RecipeKeyBergamo			   NVARCHAR(20) = N'9RP'
DECLARE @SeqRecord					   INT          = 3

DECLARE @COMPARE_FUNCTION_SEQ		   BIT          = 1
DECLARE @COMPARE_FUNCTION_CATEGORY	   BIT          = 1
DECLARE @COMPARE_FUNCTION_VALUE        BIT          = 1
DECLARE @COMPARE_FUNCTION_VALUEDETAILS BIT          = 1
DECLARE @COMPARE_FUNCTION_PROP         BIT          = 1
--------------------------------------------------------------------------------------------------------------------------
--    Definitions
--------------------------------------------------------------------------------------------------------------------------
DECLARE @DEFINE_VALUEKIND_VALUE		   NVARCHAR(20) = N'1 - Value'
DECLARE @DEFINE_VALUEKIND_OPTION	   NVARCHAR(20) = N'2 - Option'
DECLARE @DEFINE_VALUEKIND_FUNCTION	   NVARCHAR(20) = N'3 - Function'
DECLARE @DEFINE_VALUEKIND_MONITORING   NVARCHAR(20) = N'4 - Monitoring'
DECLARE @DEFINE_VALUEKIND_RUNTIME	   NVARCHAR(20) = N'5 - Runtime'
DECLARE @DEFINE_VALUEKIND_VCM		   NVARCHAR(20) = N'6 - VCM'
DECLARE @DEFINE_VALUEKIND_REPORT	   NVARCHAR(20) = N'7 - Report'
--------------------------------------------------------------------------------------------------------------------------
--    Select data
--------------------------------------------------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..##MassafraDataTable') IS NOT NULL DROP TABLE ##MassafraDataTable
IF OBJECT_ID('tempdb..##BergamoDataTable')  IS NOT NULL DROP TABLE ##BergamoDataTable

	SELECT N'Massafra : '				      AS Plant
		 , IR._Name							  AS Recipe
		 , IR.ItpRecipeName					  AS RecipeName
		 , TRY_PARSE(RIGHT(IPU._Name, 3) AS INT) AS SeqRecord
		 , IPU._Name						  AS SeqNo
		 , IUP.ItpUnitProcedureLocalName	  AS SeqLocalName
		 , IUP.ItpUnitProcedureGlobalName	  AS SeqGlobalName
		 , CASE 
				WHEN IPVI._ItpOperationInstKey IS NUll THEN N'Parameter' 
				ELSE N'Operation' 
		   END							      AS ValueType
		 , IOI.StepNumber					  AS StepNumber
		 , IOI.ItpOperationInstLocalName	  AS OperationLocalName
		 , IOI.ItpOperationInstGlobalName	  AS OperationGlobalName
		 , IOI.ExportClearance	  AS OperationExportClearance
		 , CASE 
				WHEN IPVI._ItpOperationInstKey IS NUll     AND CHARINDEX(N'SUPPLVA', IPVI._Name) > 0 THEN @DEFINE_VALUEKIND_VALUE
				WHEN IPVI._ItpOperationInstKey IS NUll     AND CHARINDEX(N'SUPPLOP', IPVI._Name) > 0 THEN @DEFINE_VALUEKIND_OPTION
				WHEN IPVI._ItpOperationInstKey IS NUll     AND CHARINDEX(N'SUPPLFX', IPVI._Name) > 0 THEN @DEFINE_VALUEKIND_FUNCTION
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'MON', IPVI._Name) > 0     THEN @DEFINE_VALUEKIND_MONITORING
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'RUN', IPVI._Name) > 0	 THEN @DEFINE_VALUEKIND_RUNTIME
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'VCM', IPVI._Name) > 0     THEN @DEFINE_VALUEKIND_VCM
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'RV', IPVI._Name) > 0		 THEN @DEFINE_VALUEKIND_REPORT
		   END								  AS ValueKind
		 , IPVI._Name						  AS Value
		 , IPVI.ItpProcessValueInstLocalName  AS ValueLocalName
		 , IPVI.ItpProcessValueInstGlobalName AS ValueGlobalName
		 , VC._Key                            AS ValueCategoryKey
		 , VC._Name							  AS ValueCategoryName 
		 , VC.ValueCategoryLocalName          AS ValueCategoryLocalName 
		 , VC.ValueCategoryGlobalName		  AS ValueCategoryGlobalName
		 , IPVI.SetpointValue                 AS SetpointValue
		 , IPVI.ExportClearance               AS ValueExportClearance  
		 , IUPI._Name                         AS SeqNameKey      
		 , IUPI.ExportClearance				  AS SeqExportClearance 	
	     , IUPI._ProcessTypeKey               AS ProcessTypeKey
		 , IPV.ParameterNumber                AS ValueRecord
	INTO ##MassafraDataTable
	  FROM [dbOdsInt].[IdcHuddle].[ItpProcessValueInst] IPVI
	  INNER JOIN [dbOdsInt].[IdcHuddle].[ItpUnitProcedureInst] IUPI
		ON IUPI._Key = IPVI._ItpUnitProcedureInstKey
	  INNER JOIN [dbOdsInt].[IdcHuddle].[ItpUnitProcedure] IUP
		ON IUP._Key = IUPI._ItpUnitProcedureKey
	  INNER JOIN [dbOdsInt].[IdcHuddle].[ItpProcessUnit] IPU
		ON IUP.ItpUnitProcedureLocalName = IPU.ItpProcessUnitLocalName
	  INNER JOIN  [dbOdsInt].[IdcHuddle].[ItpRecipe] IR
		ON IR._Key = IPVI._ItpRecipeKey
	  LEFT JOIN [dbOdsInt].[IdcHuddle].[ItpOperationInst] IOI
		ON IOI._Key = IPVI._ItpOperationInstKey
	  FULL JOIN [dbOds].[Ods].[ValueCategory] VC
		ON VC._Key = IPVI._ValueCategoryKey	
	  INNER JOIN [dbOdsInt].[IdcHuddle].[ItpProcessValue] IPV
		ON IPV._Key = IPVI._ItpProcessValueKey
	  WHERE IR._Name = @RecipeKeyMassafra	

   SELECT  N'Bergamo : '				      AS Plant
		 , IR._Name							  AS Recipe
		 , IR.ItpRecipeName					  AS RecipeName
		 , TRY_PARSE(RIGHT(IPU._Name, 3) AS INT) AS SeqRecord
		 , IPU._Name						  AS SeqNo
		 , IUP.ItpUnitProcedureLocalName	  AS SeqLocalName
		 , IUP.ItpUnitProcedureGlobalName	  AS SeqGlobalName
		 , CASE 
				WHEN IPVI._ItpOperationInstKey IS NUll THEN N'Parameter' 
				ELSE N'Operation' 
		   END							      AS ValueType
		 , IOI.StepNumber					  AS StepNumber
		 , IOI.ItpOperationInstLocalName	  AS OperationLocalName
		 , IOI.ItpOperationInstGlobalName	  AS OperationGlobalName
		 , IOI.ExportClearance				  AS OperationExportClearance
		 , CASE 
				WHEN IPVI._ItpOperationInstKey IS NUll     AND CHARINDEX(N'SUPPLVA', IPVI._Name) > 0 THEN @DEFINE_VALUEKIND_VALUE
				WHEN IPVI._ItpOperationInstKey IS NUll     AND CHARINDEX(N'SUPPLOP', IPVI._Name) > 0 THEN @DEFINE_VALUEKIND_OPTION
				WHEN IPVI._ItpOperationInstKey IS NUll     AND CHARINDEX(N'SUPPLFX', IPVI._Name) > 0 THEN @DEFINE_VALUEKIND_FUNCTION
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'MON', IPVI._Name) > 0     THEN @DEFINE_VALUEKIND_MONITORING
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'RUN', IPVI._Name) > 0	 THEN @DEFINE_VALUEKIND_RUNTIME
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'VCM', IPVI._Name) > 0     THEN @DEFINE_VALUEKIND_VCM
				WHEN IPVI._ItpOperationInstKey IS NOT NUll AND CHARINDEX(N'RV', IPVI._Name) > 0		 THEN @DEFINE_VALUEKIND_REPORT
		   END								  AS ValueKind
		 , IPVI._Name						  AS Value
		 , IPVI.ItpProcessValueInstLocalName  AS ValueLocalName
		 , IPVI.ItpProcessValueInstGlobalName AS ValueGlobalName
		 , VC._Key                            AS ValueCategoryKey
		 , VC._Name							  AS ValueCategoryName 
		 , VC.ValueCategoryLocalName          AS ValueCategoryLocalName 
		 , VC.ValueCategoryGlobalName		  AS ValueCategoryGlobalName
		 , IPVI.SetpointValue                 AS SetpointValue
		 , IPVI.ExportClearance               AS ValueExportClearance   
		 , IUPI._Name                         AS SeqNameKey          
		 , IUPI.ExportClearance				  AS SeqExportClearance
         , IUPI._ProcessTypeKey               AS ProcessTypeKey
		 , IPV.ParameterNumber                AS ValueRecord
	INTO ##BergamoDataTable
	  FROM [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpProcessValueInst] IPVI
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpUnitProcedureInst] IUPI
		ON IUPI._Key = IPVI._ItpUnitProcedureInstKey
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpUnitProcedure] IUP
		ON IUP._Key = IUPI._ItpUnitProcedureKey
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpProcessUnit] IPU
		ON IUP.ItpUnitProcedureLocalName = IPU.ItpProcessUnitLocalName
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpRecipe] IR
		ON IR._Key = IPVI._ItpRecipeKey
	  LEFT  JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpOperationInst] IOI
		ON IOI._Key = IPVI._ItpOperationInstKey
	  FULL  JOIN [BERGAMO-SV201\PLANTIT].[dbOds].[Ods].[ValueCategory] VC
		ON VC._Key = IPVI._ValueCategoryKey	
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpProcessValue] IPV
		ON IPV._Key = IPVI._ItpProcessValueKey
	  WHERE IR._Name = @RecipeKeyBergamo
	  
--	  SELECT * FROM ##MassafraDataTable ORDER BY Recipe ASC, SeqRecord ASC, ValueType DESC, OperationLocalName ASC, ValueKind ASC
--	  SELECT * FROM ##BergamoDataTable  ORDER BY Recipe ASC, SeqRecord ASC, ValueType DESC, OperationLocalName ASC, ValueKind ASC

--------------------------------------------------------------------------------------------------------------------------
--    Sequence compare
--------------------------------------------------------------------------------------------------------------------------
IF @COMPARE_FUNCTION_SEQ = 1
BEGIN
	  SELECT N'Sequences Quantity :'                                     AS ComparisonType
		   , (SELECT COUNT(DISTINCT(SeqRecord)) FROM ##MassafraDataTable WHERE Recipe = @RecipeKeyMassafra) AS Massafra
		   , (SELECT COUNT(DISTINCT(SeqRecord)) FROM ##BergamoDataTable  WHERE Recipe = @RecipeKeyBergamo)  AS Bergamo
		   , (SELECT COUNT(DISTINCT(SeqRecord)) FROM ##MassafraDataTable WHERE Recipe = @RecipeKeyMassafra AND SeqExportClearance = 1) AS MassafraUsed
		   , (SELECT COUNT(DISTINCT(SeqRecord)) FROM ##BergamoDataTable  WHERE Recipe = @RecipeKeyBergamo  AND SeqExportClearance = 1) AS BergamoUsed

	  SELECT DISTINCT
	         M.Recipe
	       , M.SeqNameKey
	       , M.ProcessTypeKey
		   , M.SeqGlobalName AS MassafraGlobalName	 
		   , M.SeqNo
		   , M.SeqExportClearance AS MassafraExportClearance
		   , M.SeqRecord
		   , B.SeqRecord
		   , B.SeqExportClearance AS BergamoExportClearance
		   , B.SeqNo
		   , B.SeqGlobalName AS BergamoGlobalName
           , B.ProcessTypeKey
           , B.SeqNameKey
		   , B.Recipe
		   , CASE WHEN M.SeqRecord IS NULL THEN 1 ELSE 0 END AS SortingValue
	  FROM ##MassafraDataTable M
	  FULL JOIN ##BergamoDataTable B
	  ON B.SeqRecord = M.SeqRecord	  
	  ORDER BY SortingValue, M.SeqRecord
END
--------------------------------------------------------------------------------------------------------------------------
--    ValueCategory compare
--------------------------------------------------------------------------------------------------------------------------
IF @COMPARE_FUNCTION_CATEGORY = 1
BEGIN
	  SELECT N'ValueCategory Quantity :'                                AS ComparisonType		
	       , (SELECT COUNT(_Key) FROM						  [dbOds].[Ods].ValueCategory) AS Massafra
		   , (SELECT COUNT(_Key) FROM [BERGAMO-SV201\PLANTIT].[dbOds].[Ods].ValueCategory) AS Bergamo  
		   , (SELECT COUNT(ValueCategoryName) FROM ##MassafraDataTable) AS MassafraUsed
		   , (SELECT COUNT(ValueCategoryName) FROM ##BergamoDataTable)  AS BergamoUsed 
END
--------------------------------------------------------------------------------------------------------------------------
--    Values compare
--------------------------------------------------------------------------------------------------------------------------
IF @COMPARE_FUNCTION_VALUE = 1
BEGIN
	  SELECT N'Sequence Values Quantity :'                               AS ComparisonType	      
		   , (SELECT COUNT(Value) FROM ##MassafraDataTable WHERE SeqRecord = @SeqRecord) AS Massafra	
		   , (SELECT COUNT(Value) FROM ##BergamoDataTable  WHERE SeqRecord = @SeqRecord) AS Bergamo	
		   , (SELECT COUNT(Value) FROM ##MassafraDataTable WHERE SeqRecord = @SeqRecord AND ValueExportClearance = 1) AS MassafraUsed
		   , (SELECT COUNT(Value) FROM ##BergamoDataTable  WHERE SeqRecord = @SeqRecord AND ValueExportClearance = 1) AS BergamoUsed	 
 
	 ;WITH M (ValueType, ValueKind, CountValue, CountValueUsed) AS (
				  SELECT ValueType
	  				   , ValueKind
	  				   , COUNT(Value)	
					   , COUNT(CASE WHEN ValueExportClearance = 1 THEN 1 ELSE NULL END)				
				  FROM ##MassafraDataTable 	
				  WHERE SeqRecord = @SeqRecord 
				  GROUP BY ValueType, ValueKind
				),
	       B (ValueType, ValueKind, CountValue, CountValueUsed) AS (
				  SELECT ValueType
	  				   , ValueKind
	  				   , COUNT(Value)	
					   , COUNT(CASE WHEN ValueExportClearance = 1 THEN 1 ELSE NULL END)				
				  FROM ##BergamoDataTable 
				  WHERE SeqRecord = @SeqRecord
				  GROUP BY ValueType, ValueKind
	            )
	  SELECT M.ValueType
	  	   , M.ValueKind
	  	   , M.CountValue     AS Maasafra
		   , B.CountValue     AS Bergamo
		   , M.CountValueUsed AS MaasafraUsed
		   , B.CountValueUsed AS BergamoUsed
		   FROM M
	  INNER JOIN B 
		ON B.ValueKind = M.ValueKind;
END	 
--------------------------------------------------------------------------------------------------------------------------
--    Values details compare
--------------------------------------------------------------------------------------------------------------------------
IF @COMPARE_FUNCTION_VALUEDETAILS = 1
BEGIN
	  EXEC [Facade].[uspCompareIdcHuddleValues]  @ValueKind = @DEFINE_VALUEKIND_VALUE	   , @SeqRecord = @SeqRecord 
	  EXEC [Facade].[uspCompareIdcHuddleValues]  @ValueKind = @DEFINE_VALUEKIND_OPTION	   , @SeqRecord = @SeqRecord 
	  EXEC [Facade].[uspCompareIdcHuddleValues]  @ValueKind = @DEFINE_VALUEKIND_FUNCTION   , @SeqRecord = @SeqRecord 
END
--------------------------------------------------------------------------------------------------------------------------
--    Process operation
--------------------------------------------------------------------------------------------------------------------------
IF @COMPARE_FUNCTION_PROP = 1
BEGIN
		
	;WITH M (OperationLocalName, OperationGlobalName, StepNumber, OperationExportClearance) AS (
				  SELECT DISTINCT OperationLocalName
				       , OperationGlobalName
					   , StepNumber	  		
					   , OperationExportClearance			
				  FROM ##MassafraDataTable 	
				  WHERE SeqRecord = @SeqRecord AND StepNumber <> 0 				
			 ),
	       B (OperationLocalName, OperationGlobalName, StepNumber, OperationExportClearance) AS (
				  SELECT DISTINCT OperationLocalName
				       , OperationGlobalName
					   , StepNumber	  		
					   , OperationExportClearance				
				  FROM ##BergamoDataTable 
				  WHERE SeqRecord = @SeqRecord AND StepNumber <> 0 	
	          )
	  SELECT M.OperationLocalName
	  	   , M.OperationGlobalName
	  	   , M.OperationExportClearance
		   , M.StepNumber - 1            AS StepNumber           
		   , B.StepNumber - 1            AS StepNumber 
		   , B.OperationExportClearance  
		   , B.OperationGlobalName 
		   , B.OperationLocalName    
		   FROM M
	  FULL JOIN B 
		ON B.StepNumber = M.StepNumber;	

DECLARE @StepCountMassafra		INT = (SELECT MAX(StepNumber) FROM ##MassafraDataTable WHERE SeqRecord = @SeqRecord)
      , @StepCountBergamo		INT = (SELECT MAX(StepNumber) FROM ##BergamoDataTable  WHERE SeqRecord = @SeqRecord)
	  , @StepCount              INT = 0
	  , @StepIterator           INT = 2

	  SET @StepCount = CASE WHEN @StepCountMassafra > @StepCountBergamo THEN @StepCountMassafra  ELSE @StepCountBergamo END

	  WHILE (@StepIterator <=  @StepCount)
	  BEGIN

		  EXEC [Facade].[uspCompareIdcHuddleValuesProp]  @ValueKind = @DEFINE_VALUEKIND_MONITORING , @SeqRecord = @SeqRecord, @StepNumber = @StepIterator

		  SET @StepIterator = @StepIterator + 1
	  END
END
--------------------------------------------------------------------------------------------------------------------------
--    Drop tables
--------------------------------------------------------------------------------------------------------------------------
	  DROP TABLE ##MassafraDataTable
	  DROP TABLE ##BergamoDataTable