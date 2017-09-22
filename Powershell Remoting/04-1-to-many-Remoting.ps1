########################################################
#
#
# Demo 1 to Many remoting
#
#
########################################################

Get-help Invoke-Command

# 1 command to multiple machines at the same time.

get-content .\computers.txt
$Sessions = get-content .\computers.txt | New-PSSession -Credential $cred
Invoke-Command -Session $Sessions -ScriptBlock { Get-Service bits,wuauserv}

$log = "system"
Invoke-Command -Session $Sessions -ScriptBlock {get-eventlog -LogName $log -Newest 5}

# use local variables remotely
Get-help about_remote_variables -ShowWindow
Invoke-Command -Session $Sessions -ScriptBlock {get-eventlog -LogName $using:log -Newest 5}


Get-content .\WMI-Machineinventory.ps1
invoke-command -Session $Sessions -FilePath .\WMI-Machineinventory.ps1
