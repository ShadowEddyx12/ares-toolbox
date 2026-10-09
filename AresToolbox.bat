@echo off
title ARES OS - Utility Toolbox
:: Force UTF-8 encoding to support borders
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: Enable ANSI Escape Sequences for Colors
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo %ESC%[91m======================================================%ESC%[0m
    echo %ESC%[91m  [!] ERROR: Administrator Privileges Required%ESC%[0m
    echo %ESC%[91m======================================================%ESC%[0m
    echo.
    echo  Please run this Toolbox as Administrator.
    echo  Right-click this file and select "Run as administrator".
    echo.
    pause
    exit
)

:menu
cls
echo %ESC%[36m┌─────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m                    ARES OS  TOOLBOX                     %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[90m                   Powered by Ares v1.0                  %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m├─────────────────────────────────────────────────────────┤%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                         %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[92m  [0]%ESC%[0m Install Winget Package Manager                     %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [1]%ESC%[0m Web Browsers                                       %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [2]%ESC%[0m Essential Apps (7-Zip, Notepad++, etc.)            %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [3]%ESC%[0m Hardware Tools (HWiNFO, CPU-Z, etc.)               %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [4]%ESC%[0m Media Players (VLC, MPC-HC)                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[95m  [5]%ESC%[0m Windows Libraries (DirectX, VC++, .NET)            %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[35m  [6]%ESC%[0m System Cleanup (Temp, Flush DNS)                   %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[91m  [7]%ESC%[0m Exit                                               %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                         %ESC%[36m│%ESC%[0m
echo %ESC%[36m└─────────────────────────────────────────────────────────┘%ESC%[0m
echo.
set /p choice="%ESC%[96m Select an option [0-7]: %ESC%[0m"

if "%choice%"=="0" goto install_winget
if "%choice%"=="1" goto browsers
if "%choice%"=="2" goto essentials
if "%choice%"=="3" goto hwtools
if "%choice%"=="4" goto media
if "%choice%"=="5" goto winlibs
if "%choice%"=="6" goto cleanup
if "%choice%"=="7" exit
goto menu

:install_winget
cls
echo %ESC%[36m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m             INSTALL WINGET PACKAGE MANAGER             %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
echo %ESC%[96m[>] Installing Winget Package Manager...%ESC%[0m
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/asheroto/winget-installer/master/winget-install.ps1 | iex"

:: FIX FONT / ANSI RESET: Ripristina i colori e la codifica della console
echo %ESC%[0m
chcp 65001 >nul

echo.
echo %ESC%[96m[>] Refreshing environment variables...%ESC%[0m
set "PATH=%PATH%;%LOCALAPPDATA%\Microsoft\WindowsApps;C:\Program Files\WindowsApps"

echo.
echo %ESC%[92m[✓] Winget installation completed!%ESC%[0m
echo.
pause
goto menu

:browsers
cls
echo %ESC%[36m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m                  INSTALL WEB BROWSERS                  %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m├────────────────────────────────────────────────────────┤%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [1]%ESC%[0m Brave Browser                                     %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [2]%ESC%[0m Mozilla Firefox                                   %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [3]%ESC%[0m Google Chrome                                     %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[91m  [4]%ESC%[0m Go Back                                           %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
set /p b_choice="%ESC%[96m Select a browser [1-4]: %ESC%[0m"
if "%b_choice%"=="1" (
    echo.
    echo %ESC%[93m[>] Installing Brave...%ESC%[0m
    winget install --id Brave.Brave --silent --accept-source-agreements --accept-package-agreements
)
if "%b_choice%"=="2" (
    echo.
    echo %ESC%[93m[>] Installing Firefox...%ESC%[0m
    winget install --id Mozilla.Firefox --silent --accept-source-agreements --accept-package-agreements
)
if "%b_choice%"=="3" (
    echo.
    echo %ESC%[93m[>] Installing Chrome...%ESC%[0m
    winget install --id Google.Chrome --silent --accept-source-agreements --accept-package-agreements
)
if "%b_choice%"=="4" goto menu
echo.
echo %ESC%[92m[✓] Finished.%ESC%[0m
pause
goto browsers

:essentials
cls
echo %ESC%[36m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m                  INSTALL ESSENTIAL APPS                %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m├────────────────────────────────────────────────────────┤%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [1]%ESC%[0m 7-Zip (Archive Manager)                           %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [2]%ESC%[0m Notepad++ (Advanced Text Editor)                  %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [3]%ESC%[0m Everything (Instant Search)                       %ESC%[36m│%ESC%[0m
echo %ESC%[32m   [4]%ESC%[0m Install ALL essential apps                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[91m  [5]%ESC%[0m Go Back                                           %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
set /p e_choice="%ESC%[96m Select an option [1-5]: %ESC%[0m"
if "%e_choice%"=="1" (
    echo.
    echo %ESC%[93m[>] Installing 7-Zip...%ESC%[0m
    winget install --id 7zip.7zip --silent --accept-source-agreements --accept-package-agreements
)
if "%e_choice%"=="2" (
    echo.
    echo %ESC%[93m[>] Installing Notepad++...%ESC%[0m
    winget install --id Notepad++.Notepad++ --silent --accept-source-agreements --accept-package-agreements
)
if "%e_choice%"=="3" (
    echo.
    echo %ESC%[93m[>] Installing Everything...%ESC%[0m
    winget install --id voidtools.Everything --silent --accept-source-agreements --accept-package-agreements
)
if "%e_choice%"=="4" (
    echo.
    echo %ESC%[93m[>] Installing all essential apps...%ESC%[0m
    winget install --id 7zip.7zip --silent --accept-source-agreements --accept-package-agreements
    winget install --id Notepad++.Notepad++ --silent --accept-source-agreements --accept-package-agreements
    winget install --id voidtools.Everything --silent --accept-source-agreements --accept-package-agreements
)
if "%e_choice%"=="5" goto menu
echo.
echo %ESC%[92m[✓] Finished.%ESC%[0m
pause
goto essentials

:hwtools
cls
echo %ESC%[36m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m                  INSTALL HARDWARE TOOLS                %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m├────────────────────────────────────────────────────────┤%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [1]%ESC%[0m HWiNFO (Monitoring)                               %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [2]%ESC%[0m CPU-Z (Hardware Info)                             %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [3]%ESC%[0m GPU-Z (Graphics Info)                             %ESC%[36m│%ESC%[0m
echo %ESC%[32m│  [4]%ESC%[0m Install ALL hardware tools                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[91m  [5]%ESC%[0m Go Back                                           %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
set /p h_choice="%ESC%[96m Select an option [1-5]: %ESC%[0m"
if "%h_choice%"=="1" (
    echo.
    echo %ESC%[93m[>] Installing HWiNFO...%ESC%[0m
    winget install --id Realix.HWiNFO --silent --accept-source-agreements --accept-package-agreements
)
if "%h_choice%"=="2" (
    echo.
    echo %ESC%[93m[>] Installing CPU-Z...%ESC%[0m
    winget install --id CPUID.CPU-Z --silent --accept-source-agreements --accept-package-agreements
)
if "%h_choice%"=="3" (
    echo.
    echo %ESC%[93m[>] Installing GPU-Z...%ESC%[0m
    winget install --id TechPowerUp.GPU-Z --silent --accept-source-agreements --accept-package-agreements
)
if "%h_choice%"=="4" (
    echo.
    echo %ESC%[93m[>] Installing all hardware tools...%ESC%[0m
    winget install --id Realix.HWiNFO --silent --accept-source-agreements --accept-package-agreements
    winget install --id CPUID.CPU-Z --silent --accept-source-agreements --accept-package-agreements
    winget install --id TechPowerUp.GPU-Z --silent --accept-source-agreements --accept-package-agreements
)
if "%h_choice%"=="5" goto menu
echo.
echo %ESC%[92m[✓] Finished.%ESC%[0m
pause
goto hwtools

:media
cls
echo %ESC%[36m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m                  INSTALL MEDIA PLAYERS                 %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m├────────────────────────────────────────────────────────┤%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [1]%ESC%[0m VLC Media Player                                  %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [2]%ESC%[0m MPC-HC (Classic Player)                           %ESC%[36m│%ESC%[0m
echo %ESC%[32m│  [3]%ESC%[0m Install ALL media players                         %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[91m  [4]%ESC%[0m Go Back                                           %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
set /p m_choice="%ESC%[96m Select an option [1-4]: %ESC%[0m"
if "%m_choice%"=="1" (
    echo.
    echo %ESC%[93m[>] Installing VLC...%ESC%[0m
    winget install --id VideoLAN.VLC --silent --accept-source-agreements --accept-package-agreements
)
if "%m_choice%"=="2" (
    echo.
    echo %ESC%[93m[>] Installing MPC-HC...%ESC%[0m
    winget install --id clsid2.MPCHC --silent --accept-source-agreements --accept-package-agreements
)
if "%m_choice%"=="3" (
    echo.
    echo %ESC%[93m[>] Installing all media players...%ESC%[0m
    winget install --id VideoLAN.VLC --silent --accept-source-agreements --accept-package-agreements
    winget install --id clsid2.MPCHC --silent --accept-source-agreements --accept-package-agreements
)
if "%m_choice%"=="4" goto menu
echo.
echo %ESC%[92m[✓] Finished.%ESC%[0m
pause
goto media

:winlibs
cls
echo %ESC%[36m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[36m│%ESC%[1;96m                 INSTALL WINDOWS LIBRARIES              %ESC%[0m%ESC%[36m│%ESC%[0m
echo %ESC%[36m├────────────────────────────────────────────────────────┤%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [1]%ESC%[0m DirectX Runtime (Legacy DX9)                      %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [2]%ESC%[0m Visual C++ Redistributable (All Versions)         %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[93m  [3]%ESC%[0m Microsoft .NET Framework (All Essential)          %ESC%[36m│%ESC%[0m
echo %ESC%[32m│  [4]%ESC%[0m Install ALL Windows Libraries                     %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[91m  [5]%ESC%[0m Go Back                                           %ESC%[36m│%ESC%[0m
echo %ESC%[36m│%ESC%[0m                                                        %ESC%[36m│%ESC%[0m
echo %ESC%[36m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
set /p l_choice="%ESC%[96m Select an option [1-5]: %ESC%[0m"
if "%l_choice%"=="1" (
    echo.
    echo %ESC%[93m[>] Installing DirectX End-User Runtime...%ESC%[0m
    winget install --id Microsoft.DirectX --silent --accept-source-agreements --accept-package-agreements
)
if "%l_choice%"=="2" (
    echo.
    echo %ESC%[93m[>] Installing Visual C++ All-in-One Redistributables...%ESC%[0m
    winget install --id Microsoft.VCRedist.2005.x86 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2005.x64 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2008.x86 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2008.x64 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2010.x86 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2010.x64 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2012.x86 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2012.x64 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2013.x86 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2013.x64 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2015+.x86 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.VCRedist.2015+.x64 --silent --accept-source-agreements --accept-package-agreements
)
if "%l_choice%"=="3" (
    echo.
    echo %ESC%[93m[>] Installing Microsoft .NET Frameworks...%ESC%[0m
    winget install --id Microsoft.DotNet.Framework.DeveloperPack_4 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.DotNet.DesktopRuntime.8 --silent --accept-source-agreements --accept-package-agreements
    winget install --id Microsoft.DotNet.DesktopRuntime.6 --silent --accept-source-agreements --accept-package-agreements
)
if "%l_choice%"=="4" (
    echo.
    where winget >nul 2>&1
    if %errorlevel% equ 0 (
        echo %ESC%[93m[>] Installing ALL Windows Libraries via Winget...%ESC%[0m
        winget install --id Microsoft.DirectX --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2005.x86 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2005.x64 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2008.x86 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2008.x64 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2010.x86 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2010.x64 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2012.x86 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2012.x64 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2013.x86 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2013.x64 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2015+.x86 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.VCRedist.2015+.x64 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.DotNet.Framework.DeveloperPack_4 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.DotNet.DesktopRuntime.8 --silent --accept-source-agreements --accept-package-agreements
        winget install --id Microsoft.DotNet.DesktopRuntime.6 --silent --accept-source-agreements --accept-package-agreements
    ) else (
        echo %ESC%[93m[>] Winget not found. Installing offline local runtimes...%ESC%[0m
        if exist "dxsetup.exe" (
            start /wait "" "dxsetup.exe" /silent
        )
        if exist "VC_redist.x64.exe" (
            start /wait "" "VC_redist.x64.exe" /quiet /norestart
        )
        if exist "VC_redist.x86.exe" (
            start /wait "" "VC_redist.x86.exe" /quiet /norestart
        )
        if exist "dotnet_installer.exe" (
            start /wait "" "dotnet_installer.exe" /q /norestart
        )
    )
)
if "%l_choice%"=="5" goto menu
echo.
echo %ESC%[92m[✓] Finished.%ESC%[0m
pause
goto winlibs

:cleanup
cls
echo %ESC%[35m┌────────────────────────────────────────────────────────┐%ESC%[0m
echo %ESC%[35m│%ESC%[1;95m                      SYSTEM CLEANUP                    %ESC%[0m%ESC%[35m│%ESC%[0m
echo %ESC%[35m├────────────────────────────────────────────────────────┤%ESC%[0m
echo.                                                         %ESC%[0m%ESC%[35m│%ESC%[0m
echo  %ESC%[90m[*] Cleaning temporary files...%ESC%[0m                         %ESC%[0m%ESC%[35m│%ESC%[0m
del /q /f /s %temp%\* >nul 2>&1                                                  %ESC%[0m%ESC%[35m│%ESC%[0m
del /q /f /s C:\Windows\Temp\* >nul 2>&1                                         %ESC%[0m%ESC%[35m│%ESC%[0m
echo  %ESC%[90m[*] Flushing DNS cache...%ESC%[0m                               %ESC%[0m%ESC%[35m│%ESC%[0m
ipconfig /flushdns >nul                                                          %ESC%[0m%ESC%[35m│%ESC%[0m
echo.                                                         %ESC%[0m%ESC%[35m│%ESC%[0m
echo %ESC%[35m└────────────────────────────────────────────────────────┘%ESC%[0m
echo.
echo %ESC%[92m [✓] Cleanup completed successfully!%ESC%[0m
echo.
pause
goto menu
