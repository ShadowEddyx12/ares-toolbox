$batUrl = "https://raw.githubusercontent.com/ShadowEddyx12/AresToolbox/main/AresToolbox.bat"
$tempBat = "$env:TEMP\AresToolbox.bat"

# Scarica ed esegue il file .bat
Invoke-WebRequest -Uri $batUrl -OutFile$tempBat -UseBasicParsing
Start-Process cmd.exe -ArgumentList "/c `"$tempBat`"" -Wait
Remove-Item $tempBat -ErrorAction SilentlyContinue
