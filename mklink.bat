mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink %HOMEPATH%"\.latexmkrc" %HOMEPATH%"\dotfiles\.latexmkrc"
mklink %HOMEPATH%"\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" %HOMEPATH%"\dotfiles\Microsoft.PowerShell_profile.ps1"
mklink /D %HOMEPATH%"\vimfiles\colors" %HOMEPATH%"\dotfiles\colors"
mklink /D %HOMEPATH%"\scripts" %HOMEPATH%"\dotfiles\scripts"
exit 0
