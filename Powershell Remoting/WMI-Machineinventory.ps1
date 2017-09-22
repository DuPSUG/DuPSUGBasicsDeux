    $adminPasswordStatus = $null
    $thermalState        = $null
    $osInfo              = Get-WMIObject Win32_OperatingSystem
    $computerInfo        = Get-WMIObject Win32_ComputerSystem
    $diskInfo            = Get-WMIObject Win32_LogicalDisk

    Switch ($computerInfo.AdminPasswordStatus) 
    {
        0 {$adminPasswordStatus = 'Disabled'}
        1 {$adminPasswordStatus = 'Enabled'}
        2 {$adminPasswordStatus = 'Not Implemented'} 
        3 {$adminPasswordStatus = 'Unknown'}
        Default {$adminPasswordStatus = 'Unable to determine'}
    }

    Switch ($computerInfo.ThermalState) 
    {
        1 {$thermalState = 'Other'}
        2 {$thermalState = 'Unknown'}
        3 {$thermalState = 'Safe'}
        4 {$thermalState = 'Warning'} 
        5 {$thermalState = 'Critical'}
        6 {$thermalState = 'Non-recoverable'}
        Default {$thermalState = 'Unable to determine'}
    }

    $output = [pscustomobject]@{"Computername"=$computerInfo.Name;
                                "OS" = $osInfo.Caption;
                                "OS Version" = $("$($osinfo.version) build $($osinfo.Buildnumber)");
                                "Domain" = $computerInfo.Domain;
                                "Disks" = $diskInfo;
                                "AdminPasswordStatus" = $adminPasswordStatus;
                                "ThermalState" = $thermalState}
                                 

    Write-output $output
