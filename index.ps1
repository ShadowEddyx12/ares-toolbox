$batUrl = "https://raw.githubusercontent.com/ShadowEddyx12/ares-toolbox/refs/heads/main/AresToolbox.bat"
$tempBat = "$env:TEMP\AresToolbox.bat"

# Spazio aggiunto tra -OutFile e $tempBat:
Invoke-WebRequest -Uri $batUrl -OutFile$tempBat -UseBasicParsing

Start-Process cmd.exe -ArgumentList "/c `"$tempBat`"" -Wait
Remove-Item $tempBat -ErrorAction SilentlyContinue
