#Lord Hagen / olehag04@nfk.no

#Print SMART DiskData til $OutputFile, kan skrives til feks. Nettverks-område, eller lokalt på disk. 
#Velg hvilken mappe $OutputFile blir lagret i med $NetworkShare og $LocalPath.

#Print SMART DISKData >  on a Network-Share or Locally.
#Chose online location with $NetworkShare or $LocalPath.


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


if ($SMARTData -match "OK") 
{
    "------------------Start------------------------" >> $OutputFile
    "Username: " | Out-File $OutputFile -NoNewline -Append
    $env:USERNAME >> $OutputFile
    "Computer: " | Out-File $OutputFile -NoNewline -Append
    $env:COMPUTERNAME >> $OutputFile
    Get-Date >> $OutputFile
    $SMARTData >> $OutputFile
    "------------------End------------------------" >> $OutputFile
}
else 
{
    "------------------Start------------------------" >> $OutputFile
    "Username: " | Out-File $OutputFile -NoNewline -Append
    $env:USERNAME >> $OutputFile
    "Computer: " | Out-File $OutputFile -NoNewline -Append
    $env:COMPUTERNAME >> $OutputFile
    Get-Date >> $OutputFile
    $SMARTData >>$OutputFile
    "------------------End------------------------" >> $OutputFile
}

#Uncommment next lines if you want results at end of script.

#Write-Host ""
#Write-Host "`t$SMARTData" -ForegroundColor Yellow
#Start-Sleep -Seconds 5
