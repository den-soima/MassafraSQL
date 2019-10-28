﻿﻿DECLARE @BergamoInfusion1   NVARCHAR(5) = N'10RP'
	  , @MassafraInfusion1  NVARCHAR(5) = N'101RP' 

DECLARE @BergamoInfusion2   NVARCHAR(5) = N'150RP'
	  , @MassafraInfusion2  NVARCHAR(5) = N'102RP' 

DECLARE @BergamoDecoction1  NVARCHAR(5) = N'9RP'
	  , @MassafraDecoction1 NVARCHAR(5) = N'99RP'

DECLARE @BergamoDecoction2  NVARCHAR(5) = N'68RP'
	  , @MassafraDecoction2 NVARCHAR(5) = N'100RP'

SELECT *
	FROM [BERGAMO-SV201\PLANTIT].[dbOdsInt].[IdcHuddle].[ItpUnitProcedureInst]
	WHERE _Name LIKE @BergamoDecoction1 + N'%' AND ExportClearance = 1

SELECT *
  FROM [dbOdsInt].[IdcHuddle].[ItpUnitProcedureInst]
  WHERE _Name LIKE @MassafraDecoction1 + N'%'

