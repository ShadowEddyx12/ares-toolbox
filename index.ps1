# Link al tuo file .bat nel repository AresToolbox
$batUrl = "https://raw.githubusercontent.com/ShadowEddyx12/AresToolbox/main/toolbox.bat"
$tempBat = "$env:TEMP\toolbox.bat"

# Scarica il file .bat
Invoke-WebRequest -Uri $batUrl -OutFile$tempBat -UseBasicParsing

# Avvia il file .bat
Start-Process cmd.exe -ArgumentList "/c `"$tempBat`"" -Wait

# Rimuovi il file temporaneo al termine
Remove-Item $tempBat -ErrorAction SilentlyContinue
