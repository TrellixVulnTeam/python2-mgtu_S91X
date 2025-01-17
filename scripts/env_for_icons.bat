@echo off
call "%~dp0env.bat"
set WINPYWORKDIR=%~dp0..\Notebooks
FOR /F "delims=" %%i IN ('cscript /nologo "%~dp0WinpythonIni.vbs"') DO set winpythontoexec=%%i
%winpythontoexec%set winpythontoexec=

rem ******************
rem missing student directory part
rem ******************

if not exist "%WINPYWORKDIR%" mkdir "%WINPYWORKDIR%"

rem if not exist "%HOME%\.spyder-py%WINPYVER:~0,1%"  mkdir "%HOME%\.spyder-py%WINPYVER:~0,1%"
rem if not exist "%HOME%\.spyder-py%WINPYVER:~0,1%\workingdir" echo %HOME%\Notebooks>"%HOME%\.spyder-py%WINPYVER:~0,1%\workingdir"

rem ******* make cython use mingwpy part *******
if not exist "%WINPYDIR%\..\settings\pydistutils.cfg" goto no_cython
if not exist "%HOME%\pydistutils.cfg" xcopy   "%WINPYDIR%\..\settings\pydistutils.cfg" "%HOME%" 
:no_cython 
