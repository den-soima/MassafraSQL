@rem *****************************************************
@rem            Updatescript - ZWeb (ObjectClasses)
@rem *****************************************************

tree /F

@echo off

@rem *** Parameters ***
@rem
SET Server=HK-MAS-SV201
SET Instanse=PLANTIT
SET Database=dbOds
SET Debug=0
SET RUN=sqlcmd -v DebugCmd=%Debug% -S %Server%\%Instanse% -d %Database% -i
@rem   
%RUN% Objectclass_ZBatchCockpitSAPConfiguration.sql
@rem
echo.
@rem
@rem %RUN% Objectclass_ZBatchCockpitSAPConfiguration.sql
%RUN% Objectclass_ZDosingBatchManagement.sql
%RUN% Objectclass_ZFTRConfiguration.sql
%RUN% Objectclass_ZFTRHeader.sql
%RUN% Objectclass_ZOPICalculation.sql
%RUN% Objectclass_ZSortableValueCategory.sql
%RUN% Objectclass_ZTemplate.sql
%RUN% Objectclass_ZTemplateValueCategory.sql
@rem %RUN% Objectclass_ZWebBatchCockpitCIPBatch.sql
%RUN% Objectclass_ZWebBatchCockpitSAP.sql
%RUN% Objectclass_ZWebBatchOverview.sql
%RUN% Objectclass_ZWebBatchOverviewValue.sql
%RUN% Objectclass_ZWebBrewBatch.sql
%RUN% Objectclass_ZWebDrillInValue.sql
%RUN% Objectclass_ZWebEventHistoryData.sql
%RUN% Objectclass_ZWebExceptionReportData.sql
%RUN% Objectclass_ZWebFTRValue.sql
%RUN% Objectclass_ZWebSAPInterfaceStatus.sql
%RUN% Objectclass_ZWebSAPInterfaceStatusValue.sql
%RUN% Objectclass_ZWebTestConformance.sql
%RUN% Objectclass_ZWebTransferSource.sql
%RUN% Objectclass_ZWebVariableConformance.sql
@rem
echo.
@rem
@echo ---                          ---
@echo        Update Finished!!!
@echo ---                          ---

pause