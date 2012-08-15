@echo OFF

IF %ERRORLEVEL% EQU 0 (
	REM We need to use a hard link otherwise Vim doesn't pick it up
	mklink /H "%USERPROFILE%\.vimrc" "%CD%\vim\vimrc"
	PAUSE
) ELSE (
	echo This script needs to be run as administrator!
	PAUSE
)
