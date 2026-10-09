$batUrl = "https://raw.githubusercontent.com/ShadowEddyx12/AresToolbox/main/AresToolbox.bat"
$tempBat = "$env:TEMP\AresToolbox.bat"

Invoke-WebRequest -Uri $batUrl -OutFile$tempBat -UseBasicParsing
Start-Process cmd.exe -ArgumentList "/c `"$tempBat`"" -Wait
Remove-Item $tempBat -ErrorAction SilentlyContinue
