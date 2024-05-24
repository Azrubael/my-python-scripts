function Test-SubnetMembership {
    param(
        [string]$clientIP,
        [string]$serverIP,
        [string]$subnetMask
    )

    $clientIPDecimal = [convert]::ToInt64($clientIP, 2)
    $serverIPDecimal = [convert]::ToInt64($serverIP, 2)
    $subnetMaskDecimal = [convert]::ToInt64($subnetMask, 2)

    $clientNetwork = $clientIPDecimal -band $subnetMaskDecimal
    $serverNetwork = $serverIPDecimal -band $subnetMaskDecimal

    if ($clientNetwork -eq $serverNetwork) {
        Write-Output "yes"
    } else {
        Write-Output "no"
    }
}

function Convert-IPv4ToBinary {
    param(
        [string]$ipv4Address
    )

    $ipParts = $ipv4Address.Split('.')
    $binaryIP = ""

    foreach ($part in $ipParts) {
        $binaryPart = [Convert]::ToString([int]$part, 2).PadLeft(8, '0')
        $binaryIP += $binaryPart
    }

    return $binaryIP
}

$binaryClient = Convert-IPv4ToBinary '192.168.1.2'
$binaryServer = Convert-IPv4ToBinary '192.168.1.5'
$binaryNetwork = Convert-IPv4ToBinary '255.255.255.0'
Test-SubnetMembership $binaryClient $binaryServer $binaryNetwork

$binaryClient = Convert-IPv4ToBinary '192.168.1.2'
$binaryServer = Convert-IPv4ToBinary '10.10.1.5'
$binaryNetwork = Convert-IPv4ToBinary '255.255.255.0'
Test-SubnetMembership $binaryClient $binaryServer $binaryNetwork