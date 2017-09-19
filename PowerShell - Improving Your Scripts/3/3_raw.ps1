#Original filename: CleanExchangeLogs.ps1

gci ‘C:\Program Files\Microsoft\Exchange Server\V15\Logging’, 'C:\inetpub\logs’ -Directory | gci -Include ‘*.log’, '*.blg’ -Recurse | ? LastWriteTime -lt (Get-Date).AddDays(-7) | Remove-Item