#Original filename: GetLockFilesRecursive.ps1

$BasePath = read-host 'Please provide base path to start search...'
$Output = read-host 'Please provide full path for output csv file...'
$date = (get-date).AddDays(0)
set-location $BasePath
$directory = (get-childitem -force -recurse | ? { $_.PSIsContainer } | select-object FullName)
$directory | foreach-object {get-childitem ($_.FullName) -force | where {($_.Name -like '~*.*') -and ($_.LastAccessTime -le $date)} | select-object FullName, LastAccessTime, LastWriteTime} | export-csv $output