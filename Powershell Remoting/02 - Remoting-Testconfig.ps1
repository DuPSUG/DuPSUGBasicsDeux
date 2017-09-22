#######################################################
#
# Demo Testing PSremoting
# 
#
#######################################################

Test-Connection 2016DC1 -Protocol WSMan
Test-NetConnection 2016DC1 -CommonTCPPort WINRM
Test-WSMAN -ComputerName 2016DC1
# Include OS info.
Test-WSMan -ComputerName 2016Dc1 -Authentication Kerberos -Credential $cred

#Hoe staat het dan ingesteld:
winrm get winrm/config

# If using GPO, you can also use this. Put this in scripts in GPO
get-content .\SetPSRemoting.ps1
#Not needed on Server 2012 and above.

# IF using GPO and need to reboot
Restart-computer Servername -Force -Wait -For WinRM

#Disabling PSRemoting 
#Disable-PSremoting
#Stop-service WinRM