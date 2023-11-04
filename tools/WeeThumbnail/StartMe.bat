@echo off

REM Check if running as administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Running as administrator.
) ELSE (
    echo This script needs to be run as administrator.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo This script needs to be run as administrator.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo This script needs to be run as administrator.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo This script needs to be run as administrator.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo This script needs to be run as administrator.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo This script needs to be run as administrator.
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    pause
    exit /b
)

:menu
cls
echo Menu:
echo 1) Install WeeThumbnail
echo 2) Uninstall WeeThumbnail
echo 3) Exit

set /p choice=Select an option:

IF "%choice%"=="1" (
    goto install
) ELSE IF "%choice%"=="2" (
    goto uninstall
) ELSE IF "%choice%"=="3" (
    exit /b
) ELSE (
    echo Invalid option. Please try again.
    timeout /t 2 >nul
    goto menu
)

:install
REM Get the full path of the WeeThumbnail.dll file
set "dllPath=%~dp0WeeThumbnail.dll"

REM Register the DLL using regsvr32.exe
regsvr32.exe /i "%dllPath%"

REM Check the exit code of regsvr32.exe
if %errorlevel%==0 (
    echo DLL installed successfully.
) else (
    echo Error installing the DLL.
)

pause
goto menu

:uninstall
REM Get the full path of the WeeThumbnail.dll file
set "dllPath=%~dp0WeeThumbnail.dll"

REM Unregister the DLL using regsvr32.exe
regsvr32.exe /u "%dllPath%"

REM Check the exit code of regsvr32.exe
if %errorlevel%==0 (
    echo DLL uninstalled successfully.
) else (
    echo Error uninstalling the DLL.
)

pause
goto menu