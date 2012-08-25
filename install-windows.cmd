@echo OFF

IF %ERRORLEVEL% EQU 0 (
	:: ======= SUBLIME TEXT 2 =======
	rmdir /S /Q "%APPDATA%\Sublime Text 2\Packages\User"
	mklink /J "%APPDATA%\Sublime Text 2\Packages\User" "%CD%\sublime2\User"

	:: ======= VIM =======
	del "%USERPROFILE%\.vimrc"
	:: We need to use a hard link otherwise Vim doesn't pick it up
	mklink /H "%USERPROFILE%\.vimrc" "%CD%\vim\vimrc"
) ELSE (
	echo This script needs to be run as administrator!
)

PAUSE
