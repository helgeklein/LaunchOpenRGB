#
# Setttings: configure
#
$profileFile = "NAME OF YOUR .ORP FILE"
$backupFolder = "PATH TO BACKUP DIRECTORY ENDING WITH A BACKSLASH\" + $env:computername
$openRGBExe = "PATH TO OpenRGB.exe"

#
# Variables: do not modify unless you know what you're doing
#
$profileSourceFolder = $env:appdata + "\OpenRGB"

#
# Script start
#

# Wait
Start-Sleep -Seconds 10

# Copy the profile file
$source = $profileSourceFolder + "\" + $profileFile
Copy-Item -Path $source -Destination $backupFolder -Force

# Launch the tool
$profileFileEscaped =  '"' + $profileFile + '"'
& $openRGBExe --noautoconnect --profile $profileFileEscaped --very-verbose
