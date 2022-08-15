@echo off

set FFMPEGDIR=%cd%/ffmpeg/bin

: add ffmpegdir to path if not found
echo.%PATH% | findstr /C:"%FFMPEGDIR%" > nul
if errorlevel 1 set PATH=%FFMPEGDIR%;%PATH%

if [%EPMODEL%]==[] goto :set_ep
goto :run

:set_ep
set "EPMODEL=I_Lite"
echo "setting default EPMODEL=I_LITE"

:run
echo "Cleaning previous files with _tracked..."
.venv\Scripts\python.exe clean.py


if [%1]==[--webcam]  goto :run_webcam
goto :run_folder

:run_webcam
echo "Running webcam with model %EPMODEL%"
.venv\Scripts\python.exe track.py --model=%EPMODEL%
EXIT /B %ERRORLEVEL%

:run_folder
echo "Running folder with model %EPMODEL%"
.venv\Scripts\python.exe track_many.py --path="Imagenes_y_videos" --dir --visualize --model=%EPMODEL%
EXIT /B %ERRORLEVEL%