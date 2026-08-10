# FFmpeg Windows Installer with Context Menu

Windows batch script that installs FFmpeg via Chocolatey and adds right-click context menu options to convert between WAV, OGG, and MP3 audio formats.

## Features

- Automatically installs Chocolatey package manager if not present
- Installs FFmpeg via Chocolatey
- Adds Windows registry entries for right-click context menu
- Convert between WAV, OGG, and MP3 formats with a single click

## Requirements

- Windows operating system
- Internet connection
- Administrator privileges (required for Chocolatey installation and registry changes)

## Usage

1. Right-click on the script and select **Run as administrator**
2. Wait for the installation to complete
3. Right-click on any WAV, OGG, or MP3 file
4. Select the conversion option from the context menu

## Manual FFmpeg Usage

After installation, you can also use FFmpeg from the command line:

```cmd
ffmpeg -i input.wav output.mp3
```
