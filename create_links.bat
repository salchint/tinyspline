@echo off
pushd ..\..\Source\test_ball\Private
if exist tinysplinecxx.h goto :end
mklink tinysplinecxx.h ..\..\..\3rdparty\tinyspline\src\tinysplinecxx.h
mklink tinyspline.h ..\..\..\3rdparty\tinyspline\src\tinyspline.h
:end
popd
exit /b 0
