$isAdmin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
if (-not $isAdmin) {
    Write-Host "Please run this script as an administrator."
    Exit
}

$policy = Get-ExecutionPolicy
if ($policy -ne 'RemoteSigned') {
    Write-Host "Execution Policy is not RemoteSigned. Changing Execution Policy..."
    Set-ExecutionPolicy RemoteSigned
    Write-Host "Execution Policy changed to RemoteSigned."
}

if ($policy -eq 'RemoteSigned' -or $policy -eq 'Bypass') {
    $action = Read-Host "Enter 'set' to change DNS to 1.1.1.1 and 1.0.0.1 or 'dhcp' to set back to automatic (DHCP)"

    function Set-Dns {
        $networkInterfaces = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled = 'True'"
        foreach ($interface in $networkInterfaces) {
            $dnsServers = "1.1.1.1", "1.0.0.1"
            $interface.SetDNSServerSearchOrder($dnsServers)
        }
    }

    function Set-DHCP {
        $networkInterfaces = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled = 'True'"
        foreach ($interface in $networkInterfaces) {
            $interface.SetDNSServerSearchOrder()
        }
    }

    if ($action -eq "set") {
        Set-Dns
        Write-Host "DNS changed to 1.1.1.1 and 1.0.0.1"
    } elseif ($action -eq "dhcp") {
        Set-DHCP
        Write-Host "DNS set back to automatic (DHCP)"
    } else {
        Write-Host "Invalid action."
    }
}
else {
    Write-Host "The script cannot execute due to the current Execution Policy. Change the policy to RemoteSigned and run the script again."
}
