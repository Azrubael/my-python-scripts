# This script uses background jobs to test the connections to multiple IP addresses concurrently, which should improve the speed of checking which IP addresses are in use on your local network 192.168.1.0/24

$ipRange = 1..254
$ipResults = @()

function Test-ConnectionAsync {
    param (
        [string]$ip
    )
    
    $result = Test-Connection -ComputerName $ip -Count 1 -Quiet
    $ipResults += [PSCustomObject]@{
        IPAddress = $ip
        InUse = $result
    }
}

$ipRange | ForEach-Object {
    $ip = "192.168.1.$_"
    Start-Job -ScriptBlock ${function:Test-ConnectionAsync} -ArgumentList $ip
}

# Wait for all jobs to complete
Get-Job | Wait-Job

$ipResults | Where-Object { $_.InUse } | ForEach-Object {
    Write-Host "IP Address $($_.IPAddress) is in use"
}
