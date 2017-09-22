############################################################
#
#
# Demo Implicit Remoting
#
#
#############################################################

$session = new-pssession -ComputerName 2016DC1 -Credential $cred

#Import-module from other computer and use it locally
Import-module -name activeDirectory -PSSession $session 

Get-aduser -Filter *

Remove-module activedirectory

Import-module -name activeDirectory -PSSession $session -Prefix Laptop
Get-command -Module activedirectory

#Type of cmdlets
