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

# Sublime Text 2
$userpackages = [Environment]::GetFolderPath("ApplicationData") + "\Sublime Text 2\Packages\User"
Remove-DirOrJunc $userpackages
mklink /J $userpackages "%CD%\sublime2\User"

# Vim
$vimrc = [Environment]::GetFolderPath("UserProfile") + "\.vimrc"
$vimfiles = [Environment]::GetFolderPath("UserProfile") + "\vimfiles"
Remove-Item $vimrc
mklink /H $vimrc "%CD%\vim\vimrc" # Hard link needed
Remove-DirOrJunc $vimfiles
mklink /J $vimfiles "%CD%\vim\vim"
