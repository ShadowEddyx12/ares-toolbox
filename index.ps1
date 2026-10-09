$batUrl = "https://raw.githubusercontent.com/ShadowEddyx12/ares-toolbox/refs/heads/main/AresToolbox.bat"
$tempBat = "$env:TEMP\AresToolbox.bat"

# Scarica il file .bat nella cartella Temp dell'utente
Invoke-WebRequest -Uri $batUrl -OutFile$tempBat -UseBasicParsing

# Avvia il file .bat
Start-Process cmd.exe -ArgumentList "/c `"$tempBat`"" -Wait

# Pulisce il file temporaneo
Remove-Item $tempBat -ErrorAction SilentlyContinue
