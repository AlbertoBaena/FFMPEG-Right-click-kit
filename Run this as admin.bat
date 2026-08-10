@echo off
chcp 65001 >nul
setlocal

:: Install Chocolatey package manager
echo Installing Chocolatey package manager...
echo (Chocolatey will install FFMPEG)
echo:
where choco >nul 2>nul
if errorlevel 1 (
    echo Chocolatey is not installed. Proceeding with installation...
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
    if errorlevel 1 (
        echo Error installing Chocolatey.
        exit /b 1
    )
) else (
    echo Chocolatey is already installed.
)

:: Update PATH for this session (useful if it was just installed)
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Install FFMPEG
echo Installing FFMPEG...
echo:
choco install -y ffmpeg
echo FFMPEG installed.

:: Add registry entries
set "BASEDIR=%~dp0"
echo Adding registry entries...
echo:
for %%f in ("%BASEDIR%REGs\*.reg") do (
    REG IMPORT "%%f"
    if errorlevel 1 (
        echo Error importing %%f
    ) else (
        echo %%f imported successfully.
    )
)

:: Explanation
echo:

echo ╔══════════════════════════════════════════╗
echo ║       FFMPEG INSTALLED SUCCESSFULLY      ║
echo ╚══════════════════════════════════════════╝

echo You can now right-click on WAV and OGG files and convert them to MP3.
echo You can also convert from MP3 to WAV and from OGG to WAV.
echo:
echo Note: if you want to use FFMPEG manually, you can do it from the terminal:
echo "ffmpeg -i file_to_convert.wav converted_file.mp3"
echo:

pause