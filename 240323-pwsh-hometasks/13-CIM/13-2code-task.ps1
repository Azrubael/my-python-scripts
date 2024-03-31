<#
A script to get all interactive and remote logon sessions for the selected remote computer and associated user information for every session.
#>

$computerName = Read-Host "Enter the name of the remote computer"

$sessions = Get-WmiObject -Class Win32_LogonSession -ComputerName $computerName

foreach ($session in $sessions) {
    $id = $session.__RELPATH -replace "\\", ""
    $q = "ASSOCIATORS OF {$id} WHERE ResultClass = Win32_Account"
    $user = Get-WmiObject -Query $q -ComputerName $computerName

    Write-Host "Logon Type: $($session.LogonType)"
    Write-Host "Start Time: $($session.ConvertToDateTime($session.StartTime))"
    Write-Host "Authentication Package: $($session.AuthenticationPackage)"
    Write-Host "Logon Id: $($session.LogonId)"
    Write-Host "User: $($user.Name)"
    Write-Host "Domain: $($user.Domain)"
    Write-Host ""
}

