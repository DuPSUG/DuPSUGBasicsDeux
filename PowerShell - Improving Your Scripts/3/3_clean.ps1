# Clean up code by removing aliasses and name consistency [use tab completion!]
# Using indentation makes it easier to read and comprehend
# Recommend rename file to something more 'PowerShell-y' like Remove-ExchangeLogFiles.ps1

Get-ChildItem 'C:\Program Files\Microsoft\Exchange Server\V15\Logging', 'C:\inetpub\logs' -Directory |
    Get-ChildItem -Include '*.log', '*.blg' -Recurse |
    Where-Object LastWriteTime -lt (Get-Date).AddDays(-7) |
    Remove-Item