# Date: 12/20/2014
# Title: Windows MSE Automatic Installer
# Author: CodeMonkeyRawks
# Website: www.codemonkeyrawks.net

# Default Directory is: C:\temp\
cd C:\temp\

Write-Host "Installing: Microsoft Security Essentials"
mseinstall.exe /s /runwgacheck

# Need to Check Registry Entries #
REG ADD "HKLM\Software\Microsoft\Microsoft Antimalware\Scan" /v ScheduleDay /t REG_DWORD /d 0x00000000 /f
REG ADD "HKLM\Software\Microsoft\Microsoft Antimalware\Scan" /v ScheduleTime /t REG_DWORD /d 0x000003c0 /f
REG ADD "HKLM\Software\Microsoft\Microsoft Antimalware\Scan" /v ScanOnlyIfIdle /t REG_DWORD /d 0x00000000 /f
