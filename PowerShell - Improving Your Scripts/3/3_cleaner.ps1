# Optimize code, Filter left increases performance drastically
# Increase functionality, convert it into a tool for re-usability
# Recommend rename file to something more tool like, such as Remove-OldFiles.ps1

[CmdletBinding()]
param(
    [Parameter(Position = 0,
        ValueFromPipeline = $true,
        ValueFromPipelineByPropertyName = $true )]
    [string[]]$Path = ('C:\Program Files\Microsoft\Exchange Server\V15\Logging\', 'C:\inetpub\logs\'),
    [Parameter(Position = 1 )]
    [string[]]$FileTypes = ('*.log', '*.blg'),
    [Parameter(Position = 2 )]
    [int]$Age = 7,
    [Parameter(Position = 3 )]
    [switch]$Remove
)

$Files = Get-ChildItem -Path $Path -File -Include $FileTypes -Recurse |
    Where-Object LastWriteTime -lt (Get-Date).AddDays( - $Age)
if ($Remove) {
    $Files | Remove-Item -WhatIf
}