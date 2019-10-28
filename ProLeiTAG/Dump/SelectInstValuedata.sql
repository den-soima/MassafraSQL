﻿﻿USE [dbOds]
GO
/****** Object:  StoredProcedure [Facade].[uspCompareProperty]    Script Date: 19.09.2019 18:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [Facade].[uspGetIntValueData]
(
    @ProcLineLocal   	NVARCHAR(10) = N''
  , @ProcLineRemote		NVARCHAR(10) = N''      
)
AS
BEGIN

DECLARE @sql NVARCHAR(MAX)
	   
    IF LEN(@Server) > 0	
	BEGIN
		BEGIN TRY
		 EXEC master.sys.sp_testlinkedserver @Server			       
		END TRY
		BEGIN CATCH
		  SELECT ERROR_NUMBER()  AS ErrorNumber
			   , ERROR_MESSAGE() AS ErrorMessage
		  RETURN
		END CATCH
	END
	ELSE BEGIN
		SET @Server = N'PLocalPlantiTServer'
	END

	SELECT  N'Massafra : '				      AS Plant
		 , IR._Name							  AS Line
		 , IR.ItpRecipeName					  AS LineName
		 , IPU._Name						  AS SeqNo
		 , IUP.ItpUnitProcedureLocalName	  AS SeqLocalName
		 , IUP.ItpUnitProcedureGlobalName	  AS SeqGlobalName
		 , CASE 
				WHEN IPVI._ItpOperationInstKey IS NUll THEN N'Parameter' 
				ELSE N'Operation' 
		   END							      AS ValueType
		 , IOI.ItpOperationInstLocalName	  AS OperationName
		 , CASE 
				WHEN CHARINDEX(N'SUPPLVA', IPVI._Name) > 0 THEN N'1 - Value'
				WHEN CHARINDEX(N'SUPPLOP', IPVI._Name) > 0 THEN N'2 - Options'
				WHEN CHARINDEX(N'SUPPLFX', IPVI._Name) > 0 THEN N'3 - Functions'
		   END								  AS ValueKind
		 , IPVI._Name						  AS Value
		 , IPVI.ItpProcessValueInstLocalName  AS ValueLocalName
		 , IPVI.ItpProcessValueInstGlobalName AS ValueGlobalName
		 , VC.ValueCategoryLocalName          AS ValueCategoryLocalName 
		 , VC.ValueCategoryGlobalName		  AS ValueCategoryGlobalName
		 , IPVI.SetpointValue
		 , IPVI.ExportClearance
	INTO #LocalDataTable
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
	  LEFT JOIN [dbOds].[Ods].[ValueCategory] VC
		ON VC._Key = IPVI._ValueCategoryKey	
	  WHERE 
	  ORDER BY Line ASC, SeqNo ASC, ValueType DESC, OperationName ASC, ValueKind ASC

	  SELECT * FROM #LocalDataTable 

   SELECT  N'Bergamo : '				      AS Plant
		 , IR._Name							  AS Line
		 , IR.ItpRecipeName					  AS LineName
		 , IPU._Name						  AS SeqNo
		 , IUP.ItpUnitProcedureLocalName	  AS SeqLocalName
		 , IUP.ItpUnitProcedureGlobalName	  AS SeqGlobalName
		 , CASE 
				WHEN IPVI._ItpOperationInstKey IS NUll THEN N'Parameter' 
				ELSE N'Operation' 
		   END							      AS ValueType
		 , IOI.ItpOperationInstLocalName	  AS OperationName
		 , CASE 
				WHEN CHARINDEX(N'SUPPLVA', IPVI._Name) > 0 THEN N'1 - Value'
				WHEN CHARINDEX(N'SUPPLOP', IPVI._Name) > 0 THEN N'2 - Options'
				WHEN CHARINDEX(N'SUPPLFX', IPVI._Name) > 0 THEN N'3 - Functions'
		   END								  AS ValueKind
		 , IPVI._Name						  AS Value
		 , IPVI.ItpProcessValueInstLocalName  AS ValueLocalName
		 , IPVI.ItpProcessValueInstGlobalName AS ValueGlobalName
		 , VC.ValueCategoryLocalName          AS ValueCategoryLocalName 
		 , VC.ValueCategoryGlobalName		  AS ValueCategoryGlobalName
		 , IPVI.SetpointValue
		 , IPVI.ExportClearance
	INTO #RemoteDataTable
	  FROM [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpProcessValueInst] IPVI
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpUnitProcedureInst] IUPI
		ON IUPI._Key = IPVI._ItpUnitProcedureInstKey
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpUnitProcedure] IUP
		ON IUP._Key = IUPI._ItpUnitProcedureKey
	  INNER JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpProcessUnit] IPU
		ON IUP.ItpUnitProcedureLocalName = IPU.ItpProcessUnitLocalName
	  INNER JOIN  [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpRecipe] IR
		ON IR._Key = IPVI._ItpRecipeKey
	  LEFT JOIN [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpOperationInst] IOI
		ON IOI._Key = IPVI._ItpOperationInstKey
	  LEFT JOIN [BERGAMO-SV201\PLANTIT].[dbOds].[Ods].[ValueCategory] VC
		ON VC._Key = IPVI._ValueCategoryKey	
	  ORDER BY Line ASC, SeqNo ASC, ValueType DESC, OperationName ASC, ValueKind ASC

	  SELECT * FROM #RemoteDataTable 











	  DROP TABLE #LocalDataTable
	  DROP TABLE #RemoteDataTable
END