@echo off
echo "CREATING PYTHON VIRTUAL ENVIRONMENT"
python3 -m venv .venv
if %ERRORLEVEL% == 0 goto :next
goto :errors

:next
echo "ACTIVATING VIRTUAL ENVIRONMENT"
.venv\Scripts\pip.exe install -r requirements.txt

if %ERRORLEVEL% == 0 exit /b 0
goto :errors


:errors 
echo "Failed to setup virtual environment. Do you have python 3 installed and registered in your PATH?"
exit /b 1