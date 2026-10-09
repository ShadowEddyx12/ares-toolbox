$batUrl = "https://raw.githubusercontent.com/ShadowEddyx12/ares-toolbox/refs/heads/main/AresToolbox.bat"
$tempBat = "$env:TEMP\AresToolbox.bat"

# Scarica il file .bat
Invoke-WebRequest -Uri $batUrl -OutFile$tempBat -UseBasicParsing

# Esegue il file .bat
Start-Process cmd.exe -ArgumentList "/c `"$tempBat`"" -Wait

# Rimuove il file temporaneo
Remove-Item $tempBat -ErrorAction SilentlyContinue
