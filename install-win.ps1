$ErrorActionPreference = "Stop"

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}
function Remove-DirOrJunc {
    # Using Remove-Item -Force -Recurse on a junction point will delete
    # the real files as well, while using rmdir /S /Q will not
    cmd /c rmdir /s /q $args
}
function mklink {
    cmd /c mklink $args
}

if (!(Test-Administrator)) {
    Write-Host "Run this as admin!"
    Break
}

# Needed for Chocolatey
Set-ExecutionPolicy Bypass

Install-Package nuget -Provider Bootstrap
Install-Package chocolatey -Provider Bootstrap

# Apps - Development
Install-Package git -Provider chocolatey # TODO: Switch to GitHub
#Install-Package vim -Provider chocolatey
Install-Package sublimetext3 -Provider chocolatey

# Apps - Utilities
Install-Package 7zip -Provider chocolatey

# Config - Git
git config --global credential.helper wincred

# Config - Vim
$vimrc = [Environment]::GetFolderPath("UserProfile") + "\.vimrc"
$vimfiles = [Environment]::GetFolderPath("UserProfile") + "\vimfiles"
if (Test-Path $vimrc) {
    Remove-Item $vimrc
}
mklink /H $vimrc "%CD%\vim\vimrc" # Hard link needed
if (Test-Path $vimfiles) {
    Remove-DirOrJunc $vimfiles
}
mklink /J $vimfiles "%CD%\vim\vim"

# Config - Sublime Text 3
$userpackages = [Environment]::GetFolderPath("ApplicationData") + "\Sublime Text 3\Packages\User"
if (Test-Path $userpackages) {
    Remove-DirOrJunc $userpackages
}
mklink /J $userpackages "%CD%\sublime3\User"
