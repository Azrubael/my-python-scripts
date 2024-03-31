<#
A script to get all interactive and remote logon sessions for the selected remote computer and associated user information for every session.
#>

$computerName = Read-Host "Enter the name of the remote computer"

$sessions = Get-WmiObject -Class Win32_LogonSession -ComputerName $computerName

$result = @()

foreach ($session in $sessions) {
    $id = $session.__RELPATH -replace "\\", ""
    $q = "ASSOCIATORS OF {$id} WHERE ResultClass = Win32_Account"
    $user = Get-WmiObject -Query $q -ComputerName $computerName
    $data = @{
        "LogonType" = $session.LogonType
        "StartTime" = $session.ConvertToDateTime($session.StartTime)
        "AuthenticationPackage" = $session.AuthenticationPackage
        "LogonId" = $session.LogonId
        "Name" = $user.Name
        "Domain" = $user.Domain
    }
    $result += New-Object -TypeName PSObject -Property $data

}


$result | Format-Table -AutoSize -Property `
    LogonType, StartTime, AuthenticationPackage, LogonId, Name, Domain
