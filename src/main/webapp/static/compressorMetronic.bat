@echo off
rem author thinkgem@163.com
echo Compressor JS and CSS

call compressor\compressor.bat metronicAssets\global\scripts\app.js
call compressor\compressor.bat metronicAssets\pages\scripts\login-4.js
call compressor\compressor.bat metronicAssets\pages\css\login-4.css


echo.
echo Compressor Success
pause
echo on