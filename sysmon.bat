copy /z /y "\\internal\SYSVOL\internal.Tabella.cz\scripts\sysmon\sysmon-config.xml" "C:\windows\"
sysmon -c c:\windows\config.xml

sc query "Sysmon" | Find "RUNNING"
If "%ERRORLEVEL%" EQU "1" (
goto startsysmon
)
:startsysmon
net start Sysmon

If "%ERRORLEVEL%" EQU "1" (
goto installsysmon
)
:installsysmon
"\\internal\SYSVOL\internal.Tabella.cz\scripts\sysmon\sysmon.exe" /accepteula -i \\internal\SYSVOL\internal.Tabella.cz\scripts\sysmon\sysmon-config.xml
