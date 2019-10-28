@rem *****************************************************
@rem            Updatescript - Import data
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
%RUN% 001_dbOds_Enumeration.sql
%RUN% 002_dbOds_EnumerationText.sql
%RUN% 003_dbOds_ValueCategoryGroup.sql
%RUN% 004_dbOds_ValueCategory.sql
%RUN% 005_dbOds_ValueCategoryGrouping.sql
@rem
echo.
@rem
@echo ---                          ---
@echo        Update Finished!!!
@echo ---                          ---

pause