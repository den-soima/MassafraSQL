@rem *****************************************************
@rem            Updatescript - Import data
@rem *****************************************************
@echo off
tree /F
@rem *** Parameters ***
@rem
SET Server=HK-MAS-SV201
SET Instanse=PLANTIT
SET Database=dbOds
SET Debug=0
SET RUN=sqlcmd -v DebugCmd=%Debug% -S %Server%\%Instanse% -d %Database% -i
@rem   
%RUN% 001_ValueCategory_AddColumns.sql
@rem
echo.
@rem
@echo ---                          ---
@echo        Update Finished!!!
@echo ---                          ---

pause