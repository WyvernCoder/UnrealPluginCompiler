@echo off
setlocal

echo Confirm your working directory: %CD% 
echo If is located in PluginCompiler, then continue. 
pause
cls

set /p "PLUGIN_NAME=Input your Plugin Dir Name here: "
cls

REM === CONFIGURE THESE THREE PATHS ===

REM Path to your Unreal Engine installation (NO QUOTES!!)
set UE=C:\XXXXXXXX\UE_5.5

REM Build configuration (Development / Debug / Shipping)
set CONFIG=Development

REM Absolute path to uproject
set PROJECT=%CD%\PluginCompiler.uproject

REM === DO NOT EDIT BELOW THIS LINE ===

"%UE%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe" ^
    -plugin="%CD%\Plugins\%PLUGIN_NAME%\%PLUGIN_NAME%.uplugin" ^
    -Mode=Build ^
    -Target="UnrealEditor Win64 %CONFIG%" ^
    -Project="%PROJECT%"

echo.
echo ============================================
echo   Plugin build finished.
echo   Output should be inside:
echo   Plugins\%PLUGIN_NAME%\Binaries\
echo ============================================
echo.

REM Clear Caches
rmdir /s /q "%CD%\Binaries"
rmdir /s /q "%CD%\Intermediate"

endlocal
pause
