#Lord Hagen / olehag04@nfk.no

#Velg hvor data blir lagret i med $NetworkShare og $LocalPath.

#Chose location with $NetworkShare or $LocalPath.


#Get SMART DATA.
$SMARTData = WMIC.exe diskdrive get status

#NetworkShare Location.
$NetworkShare = "x:\NetworkFolder\location"
$LocalPath = "$env\Folder\Location"

#If NetworkShare is accesible, save there. if not, use local path.
if (Test-Path $NetworkShare) 
{$OutputFile = "$NetworkShare\SMARTDISKLOG.txt"} 
else 
{$OutputFile = "$LocalPath\SMARTDISKLOG.txt"}


"------------------Start------------------------" >> $OutputFile
"Username: " | Out-File $OutputFile -NoNewline -Append
$env:USERNAME >> $OutputFile
"Computer: " | Out-File $OutputFile -NoNewline -Append
$env:COMPUTERNAME >> $OutputFile
Get-Date >> $OutputFile
$SMARTData >> $OutputFile
"------------------End------------------------" >> $OutputFile
