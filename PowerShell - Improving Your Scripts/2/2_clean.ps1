# Use Parameters to get the user to provide the data you want to use, not Read-Host
# You can even provide visual feedback or output to see which machine is being processed

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string[]]$ComputerName
)

foreach ($Computer in $ComputerName) {
    Write-Output "Restarting computer: '$Computer'"
    Restart-Computer -ComputerName $Computer -Force
}