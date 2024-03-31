<#
A script to get all interactive and remote logon sessions for the selected remote computer and associated user information for every session.
#>

# param([string]$computername = $env:computername)
# param([string]$computername = "localhost")
[string]$computerName = Read-Host "Enter the name of the remote computer"

function Get-LoggedOnUser {
    param ($computername)
    Get-WmiObject -Class Win32_LogonSession -ComputerName $computername | ForEach-Object {
        $data = $_
        $id = $data.__RELPATH -replace "\""", "'"
        $q = "ASSOCIATORS OF {$id} WHERE ResultClass = Win32_Account"
        Get-WmiObject -ComputerName $computername -Query $q |
        Select-Object @{
            N="User";
            E={$_.Caption}
        },
        @{
            N="LogonTime";
            E={$data.ConvertToDateTime($data.StartTime)}
        }
    }
}

Get-LoggedOnUser -computername $computername

