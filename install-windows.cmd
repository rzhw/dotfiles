@echo OFF

IF %ERRORLEVEL% EQU 0 (
	:: ======= SUBLIME TEXT 2 =======
	rmdir /S /Q "%APPDATA%\Sublime Text 2\Packages\User"
	mklink /J "%APPDATA%\Sublime Text 2\Packages\User" "%CD%\sublime2\User"

	:: ======= VIM =======
	del "%USERPROFILE%\.vimrc"
	mklink /H "%USERPROFILE%\.vimrc" "%CD%\vim\vimrc" &:: Hard link needed
	rmdir /S /Q "%USERPROFILE%\vimfiles"
	mklink /J "%USERPROFILE%\vimfiles" "%CD%\vim\vim"
) ELSE (
	echo This script needs to be run as administrator!
)

PAUSE
