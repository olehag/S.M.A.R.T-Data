#Lord Hagen / olehag04@nfk.no
#Print SMART DiskData til $utData, kan skrives til feks. Fellesområde, eller lokalt på disk. 
#Velg hvilken mappe $utData blir lagret i med $felleslagring.


$InnData = WMIC.exe diskdrive get status
$Felleslagring = "S:\Installasjonsfiler\DiskFeil"

if (Test-Path $Felleslagring) 
{$utData = "$felleslagring\Diskfeil.txt"} 
else 
{$utData = "$env\nypc\SMARTDISKlog"}

if (Test-Path $Felleslagring)
{

    if ($InnData -match "OK") 
    {
        Write-Host ""
        Write-Host "`tSMART-Disk OK!" -ForegroundColor Green
        "------------------Start------------------------" >> $utData
        "Brukernavn: " | Out-File $utData -NoNewline -Append
        $env:USERNAME >> $utData
        "Datamaskin: " | Out-File $utData -NoNewline -Append
        $env:COMPUTERNAME >> $utData
        Get-Date >> $utData
        $InnData >> $utData
        "------------------Slutt------------------------" >> $utData
    }
    else 
    {
        Write-Host ""
        Write-Host "`tMulig feil!" -ForegroundColor Red
        "------------------Start------------------------" >> $utData
        $env:USERNAME >> $utData
        $env:COMPUTERNAME >> $utData
        Get-Date >> $utData
        $InnData >>$utData
        "------------------Slutt------------------------" >> $utData
        Write-Host ""
        Write-Host ""
        Start-Sleep -Seconds 2

    }
    
} 
else 
{Write-Host "Ikke tilkoblet NFK-Nettverket, lagret lokalt!"}

