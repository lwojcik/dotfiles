Set-PSReadlineOption -BellStyle None

$foregroundColor = 'white'
$time = Get-Date
$psVersion= $host.Version.Major
$curUser= (Get-ChildItem Env:\USERNAME).Value
$curComp= (Get-ChildItem Env:\COMPUTERNAME).Value
$isAdmin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

Write-Host "Greetings, $curUser!" -foregroundColor $foregroundColor
Write-Host "It is: $($time.ToLongDateString())"
Write-Host "You're running PowerShell version: $psVersion"
Write-Host "Your computer name is: $curComp"
Write-Host

function Prompt {

$curtime = Get-Date

Write-Host -NoNewLine ("{0:HH}:{0:mm}:{0:ss} " -f (Get-Date)) -foregroundColor $foregroundColor
Write-Host -NoNewLine "" -foregroundColor $foregroundColor
Write-Host -NoNewLine "$curUser@$curComp" -foregroundColor Green
Write-Host -NoNewLine ":$((Get-Location).Path)" -foregroundColor Cyan
If ($isAdmin -eq $True) { Write-Host -NoNewLine "#" -foregroundColor Green }
Else { Write-Host -NoNewLine "$" -foregroundColor $foregroundColor }

$host.UI.RawUI.WindowTitle = "PS >> User: $curUser >> Current DIR: $((Get-Location).Path)"

Return " "

}