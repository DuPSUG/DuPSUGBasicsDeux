# To be used later
if (!(Test-Path -Path DuPSUG:)) {
    New-PSDrive -Name DuPSUG -PSProvider FileSystem -Root 'Git:\GitHub\Events\Events\DuPSUG\DuPSUG - Beginners Part Deux\PowerShell - Improving Your Scripts\1' | Out-Null
}
$Path = 'DuPSUG:'
Set-Location $Path
Clear-Host

# Original script

Measure-Command {
    .\1_raw.ps1
} | Select-Object TotalSeconds

# Head back to parent folder because original script moves you
Set-Location $Path

Measure-Command {
    .\1_clean.ps1 -BasePath C:\Temp -Output C:\Temp\clean.csv
} | Select-Object TotalSeconds

# Head back to parent folder because original script moves you
Set-Location $Path

Measure-Command {
    .\1_cleaner.ps1 -BasePath C:\Temp -OutputFolder C:\Temp -Save
} | Select-Object TotalSeconds

Measure-Command {
    . .\1_cleanest.ps1
    Get-LockedFiles -BasePath C:\Temp -OutputFolder C:\Temp -Save
} | Select-Object TotalSeconds

#Just for good 'measure'
Measure-Command {
    Get-LockedFiles -BasePath C:\Temp -OutputFolder C:\Temp -Save
} | Select-Object TotalSeconds


# Help me!
Clear-Host
Get-ChildItem -Path . -Filter '1_*.ps1' -File | Where-Object {$_.Name -notlike '*measure*'} |
    ForEach-Object {
    Get-Help $_.FullName
}

Get-Help Get-LockedFiles -Full