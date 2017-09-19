# Introduce Parameters
# Clean up code by removing aliasses and name consistency [use tab completion!]
# Recommend rename file to something more 'PowerShell-y' like Get-LockedFiles.ps1
param(
    $BasePath,
    $Output
)

$Date = (Get-Date).AddDays(0)
Set-Location $BasePath
$Directory = (Get-Childitem -Force -Recurse | Where-Object { $_.PSIsContainer } | Select-Object FullName)
$Directory | Foreach-Object {Get-Childitem ($_.FullName) -Force | Where-Object {($_.Name -like '~*.*') -and ($_.LastAccessTime -le $date)} | Select-Object FullName, LastAccessTime, LastWriteTime} | Export-Csv $output