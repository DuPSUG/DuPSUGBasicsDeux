#Pre-Demo script

#Setup VM omgeving.
Restart-service vmms
$computers = '2016DC1','WSUS','2012R201','Windows10-Insider'
Start-vm -VM $computers

#Import Credentials
$cred = Import-Clixml D:\Powershell\creds.xml 
$credstandalone = Import-Clixml D:\Powershell\Cred-Standalone.xml

#Set trustedhosts
#$trustedhosts = '2016DC1,WSUS,2012R201,Windows10-Insider,192.168.100.*'
#Set-Item WSMan:\localhost\Client\TrustedHosts -Value "$trustedhosts"

Set-location #path to scripts folder#
