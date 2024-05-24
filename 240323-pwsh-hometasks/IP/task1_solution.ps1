# shellcheck shell=powershell

param(
    [Parameter(Mandatory=$true)]
    [ValidatePattern('^(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)$')]
    [string]$ip_address_1,

    [Parameter(Mandatory=$true)]
    [ValidatePattern('^(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)$')]
    [string]$ip_address_2,

    [Parameter(Mandatory=$true)]
    [ValidatePattern('^(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)$|^(\d|[12]\d|3[012])$')]
    [string]$network_mask
)


# Calculate the network address based on the IP address and subnet mask
function Test-NetworkAddress {
    param(
        [string]$clientIP,
        [string]$serverIP,
        [string]$mask
    )

    $clientIPInt = [Convert]::ToInt32($clientIP, 2)
    $serverIPInt = [Convert]::ToInt32($serverIP, 2)
    $maskInt = [Convert]::ToInt32($mask, 2)

    $clientNetwork = $clientIPInt -band $maskInt
    $serverNetwork = $serverIPInt -band $maskInt

    if ($clientNetwork -eq $serverNetwork) {
        return "yes"
    } else {
        return "no"
    }
}


# Convert subnet from prefix format into IPv4
function Convert-CIDRtoMask {
    param ( [string]$mask )

    $cidr = [int]::Parse($mask)
    $subnetMask = ""

    for ($i = 0; $i -lt 4; $i++) {
        if ($cidr -ge 8) {
            $subnetMask += '255'
            $cidr -= 8
        } else {
            $subnetMask += [Math]::Pow(2, 8) - [Math]::Pow(2, 8 - $cidr)
            $cidr = 0
        }

        if ($i -lt 3) {
            $subnetMask += '.'
        }
    }

    return $subnetMask
}


# Convert an addresses into binary sequence
function Convert-IPv4ToBinary {
    param( [string]$ipv4Address )

    $ipParts = $ipv4Address.Split('.')
    $binaryIP = ""

    foreach ($part in $ipParts) {
        $binaryPart = [Convert]::ToString([int]$part, 2).PadLeft(8, '0')
        $binaryIP += $binaryPart
    }

    return $binaryIP
}


# Convert network mask in IPv4 if it necessary
if ($network_mask -match '^(\d|[12]\d|3[012])$') {
    $mask = Convert-CIDRtoMask $network_mask
} else {
    $mask = $network_mask
}


# Convert all addresses into binary sequences
$binaryClient = Convert-IPv4ToBinary $ip_address_1
$binaryServer = Convert-IPv4ToBinary $ip_address_2
$binaryNetwork = Convert-IPv4ToBinary $mask

# Write-Output $binaryClient
# Write-Output $binaryServer
# Write-Output $binaryNetwork

# Validate if the IP addresses are in the same network
$answer = Test-NetworkAddress $binaryClient $binaryServer $binaryNetwork

Write-Output $answer