##########################################################
#
# Demo 1-1 Remoting
#
#
##########################################################
Clear-Host

#Determine PSSession cmdlets
Get-command -ParameterName session
(Get-command -ParameterName session).count
Get-command -noun PSSession
Get-help Enter-PSSession -ShowWindow

Test-WSMan -ComputerName WSUS -Credential $credstandalone -Authentication default
Enter-PSSession -ComputerName WSUS -Credential $credstandalone

#What can we do?
$ENV:Computername
Dir c:
Get-Process wsmprovhost -includeusername | Select Username, Starttime
Get-module -ListAvailable
Get-windowsFeature | Where Installed
Import-module web*
Get-PSdrive
cd iis:
Dir
Dir sites
Exit-pssession

#region PSSessions
# Using PSSessions, Why?
Enter-pssession -ComputerName WSUS -Credential $credstandalone
$p = get-process
$p
Exit-PSSession

#wait, I forgot something let's reconnect and look at it again.
Enter-PSSession -ComputerName WSUS -Credential $credstandalone
$p
Exit-PSSession

# Let's create a persistent session
$session = New-PSSession -ComputerName WSUS -Credential $credstandalone -Name Demo1
Get-PSSession

#Go in and use the session
Enter-PSSession -Session $session
$p =get-process
$p
Exit-pssession

get-pssession

#re-enter the session
Enter-PSSession -Session $session
$p | Sort Id 
Exit-PSSession

Remove-pssession -Name Demo1

#endregion PSSessions

#region invoke-command 1-1
invoke-command -ComputerName WSUS -Credential $credstandalone -ScriptBlock {dir iis:\sites}
invoke-command -ComputerName WSUS -Credential $credstandalone -ScriptBlock {import-module web*;dir iis:\sites}
invoke-command -ComputerName WSUS -Credential $credstandalone -ScriptBlock {$p = get-process}
invoke-command -ComputerName WSUS -Credential $credstandalone -ScriptBlock {$p}

$session = New-PSSession -ComputerName WSUS -Credential $credstandalone -Name Demo2

Invoke-command -Session $session -ScriptBlock {$p = get-process}

Invoke-command -Session $session -ScriptBlock {$p}
Invoke-command -Session $session -ScriptBlock {$p} | get-member
 
 Enter-PSSession -Session $session
 $p | Get-Member
 Exit-pssession
 remove-pssession -Name demo2 

#endregion invoke-command 1-1

#Demo the Powershell ISE remoting.
