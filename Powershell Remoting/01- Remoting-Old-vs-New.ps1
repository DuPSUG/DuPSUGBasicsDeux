###############################################################
#
#
# Demo legacy vs WSMAN
# Run this from the  Windows10-insider Virtual domain joined machine
#
#
###############################################################
<#
$Computers = "2016DC1,WSUS,2012R201,localhost"
import-module *

# CMDLets with a computername parameter
Get-command -ParameterName Computername

#Legacy vs WSMAN
Get-service -Name Bits
Get-help get-service
Get-help get-service -Parameter Computername
Get-help get-service -Parameter Credential
Get-service Bits,Wuauserv -ComputerName $Computers
Get-service Bits,Wuauserv -ComputerName $Computers | Select MachineName, Name, Status

#WSMAN
Invoke-command -ScriptBlock {get-service wuauserv,bits} -ComputerName $Computers 

#Add fake computer
$Computers += "Foo"

#Let's compare the two
Measure-command { get-service bits,wuauserv -ComputerName $Computers | Select Machinename, Name, Status -OutVariable a}
$a

Measure-command { invoke-command -ScriptBlock {get-service wuauserv,bits} -ComputerName $Computers -OutVariable b}
$b
#>
Get-help About_remote