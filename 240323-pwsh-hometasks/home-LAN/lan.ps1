# A powershell script to check all the IP's that are using in my local network 192.168.1.0/24 at the moment

1..254 | ForEach-Object {
    $ip = "192.168.1.$_"
    $pingable = Test-Connection -ComputerName $ip -Count 1 -Quiet
    if ($pingable) {
        Write-Host "IP Address $ip is in use"
    }
}