#load PC profile
#make symbolic link as below
. 'C:\Users\Takuya\Documents\WindowsPowerShell\user.PowerShell_profile.ps1'

#for console
function prompt {
	$promptString = "PS " + $(Get-Location) + ">"
	# our theme
	$cdelim = [ConsoleColor]::DarkGray
	$chost = [ConsoleColor]::DarkGray
	$cloc = [ConsoleColor]::Red
	$cgit = [ConsoleColor]::DarkCyan

	$gitbranch = git_branch

	if ( $Host.Name -eq "ConsoleHost" )
	{
		write-host '[' -n -f $cdelim
		write-host ($env:username) -n -f $chost
		#write-host "@" -n -f $cdelim
		#write-host ([net.dns]::GetHostName()) -n -f $chost
		write-host ' ' -n -f $cdelim
		write-host (shorten-path (pwd).Path).Replace("\","/") -n -f $cloc
	   	write-host ']' -n -f $cdelim
		write-Host "$gitBranch" -n -f $cgit 
	   	write-host '$' -n -f $cdelim
	}

	else
	{
		Write-Host $promptString -n
	}

	return ' '
}

#shortening path
function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}
