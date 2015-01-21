#for application
Set-Alias vim 'C:\Program Files (x86)\vim\gvim.exe'
Set-Alias subl 'C:\Program Files\Sublime Text 3\sublime_text.exe'
Set-Alias processing 'C:\Users\Takuya\processing-2.2.1\processing.exe'
Set-Alias processing-java 'C:\Users\Takuya\processing-2.2.1\processing-java.exe'
Set-Alias pdf-viewer 'C:\Program Files\Tracker Software\PDF Viewer\PDFXCview.exe'
Set-Alias TexStudio 'C:\Program Files (x86)\TeXstudio\texstudio.exe'
Set-Alias foobar2000 'C:\Program Files (x86)\foobar2000\foobar2000.exe'
Set-Alias Chrome 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Set-Alias scilab 'C:\Program Files\scilab-5.5.1\bin\WScilex.exe'
Set-Alias VirtualBox 'C:\Program Files\Oracle\VirtualBox\VirtualBox.exe'
Set-Alias Inkscape 'C:\Program Files (x86)\Inkscape\inkscape.exe'
Set-Alias Mingw 'C:\MinGW\libexec\mingw-get\guimain.exe'
Set-Alias Eclipse 'C:\Program Files\eclipse4.3\eclipse\eclipse.exe'
Set-Alias CCleaner 'C:\Program Files\CCleaner\CCleaner64.exe'
Set-Alias oo-draw 'C:\Program Files (x86)\OpenOffice.org 3\program\sdraw.exe'
Set-Alias oo 'C:\Program Files (x86)\OpenOffice.org 3\program\soffice.exe'
Set-Alias ms-excel 'C:\Program Files\Microsoft Office 15\root\office15\EXCEL.EXE'
Set-Alias ms-word 'C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE'
Set-Alias ms-powerpoint 'C:\Program Files\Microsoft Office 15\root\office15\POWERPNT.EXE'
Set-Alias Snipping-Tool 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Snipping Tool.lnk'
Set-Alias teraterm 'C:\Program Files (x86)\teraterm\ttermpro.exe'
Set-Alias VNCviewer 'C:\Users\Takuya\Downloads\VNC-Viewer-5.2.2-Windows-64bit.exe'
Set-Alias visualstudio 'C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe'
Set-Alias fusion360 'C:\Users\Takuya\AppData\Local\Autodesk\webdeploy\production\f0587cd38964118f8005389472d4fd4f3fd646f9\Fusion360.exe'
Set-Alias firefox 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
if(Test-Path Function:\Prompt) {Rename-Item Function:\Prompt PrePoshGitPrompt -Force}


#for git
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

# Load posh-git example profile
. 'C:\tools\poshgit\dahlbyk-posh-git-869d4c5\profile.example.ps1'

Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {if(Test-Path Function:\PrePoshGitPrompt){++$global:poshScope; New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;$private:p = PrePoshGitPrompt; if(--$global:poshScope -eq 0) {Remove-Item function:\Write-Host -Force}}PoshGitPrompt}

$GitPromptSettings.EnableFileStatus = $false    # 簡易ステータス非表示


#for console
function prompt {
   # our theme
   $cdelim = [ConsoleColor]::DarkCyan
   $chost = [ConsoleColor]::Green
   $cloc = [ConsoleColor]::Cyan
 
   write-host "$([char]0x0A7) " -n -f $cloc
   write-host ([net.dns]::GetHostName()) -n -f $chost
   write-host ' {' -n -f $cdelim
   write-host (shorten-path (pwd).Path) -n -f $cloc
   write-host '}' -n -f $cdelim
   return ' '
}
function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}
