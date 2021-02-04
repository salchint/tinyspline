@echo off
set BUILD_CONFIG=Release
:: set BUILD_CONFIG=tinysplinepython
set BUILD_DIR=%~dp0\build

if not exist "%VSINSTALLDIR%" goto :NOVS

if not exist "%BUILD_DIR%" ( mkdir "%BUILD_DIR%" )
pushd "%BUILD_DIR%"
if not exist tinyspline.sln ( cmake .. -G "Ninja Multi-Config" -DTINYSPLINE_ENABLE_PYTHON=True )
cmake --build . --config %BUILD_CONFIG%

if %ERRORLEVEL% NEQ 0 goto :END
REM copy /Y bin\RelWithDebInfo\pyTools.dll ..\..\Content\data\dll
REM copy /Y bin\RelWithDebInfo\pyTools.pdb ..\..\Content\data\dll
goto :END

:NOVS
echo Set the Visual Studio Environment before calling %~nx0
exit /b 1

:END
popd
exit /b 0
