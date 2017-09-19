$hs = @”
Press 1 to reboot computera
Press 2 to reboot compuertb
Press 3 to reboot computera and computerb

“@

$x = Read-Host -Prompt $hs

switch ($x) {
    1 {Restart-Computer -ComputerName $computera; break}
    2 {Restart-Computer -ComputerName $computerb; break}
    3 {
        Restart-Computer -ComputerName $computera
        Restart-Computer -ComputerName $computerb
        break
    }
}