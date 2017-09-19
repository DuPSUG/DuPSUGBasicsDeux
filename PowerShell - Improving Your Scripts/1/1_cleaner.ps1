# Optimize code, Filter left increases performance drastically
# Provide increased functionality and clean up unnecessary code

[CmdletBinding()]
param(
    [Parameter( Position = 0,
        Mandatory = $true)]
    [ValidateScript( {Test-Path $_})]
    [Alias('Please provide base path to start search')]
    $BasePath,
    [Parameter( Position = 1)]
    [int]$Age = 0,
    [Parameter( Position = 2)]
    [HelpMessage('Please provide full path for output csv file')]
    [string]$OutputFolder = $PSScriptRoot,
    [Switch]$Save
)

$Date = (Get-Date).AddDays( - $Age)
Get-ChildItem -Path $BasePath -Filter '~*.*' -File -Recurse -Force  |
    Where-Object {$_.LastAccessTime -le $Date} |
    Select-Object FullName, LastAccessTime, LastWriteTime |
    Tee-Object -Variable LockedFiles
if ($Save) {
    $FileName = '\LockedFiles_' + (Get-Date -Format ddMMyyyy) + '.csv'
    $Output = Join-Path -Path $OutputFolder -ChildPath $FileName
    $LockedFiles | Export-Csv -NoTypeInformation -Path $Output -Encoding UTF8 -Force
}
