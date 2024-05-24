# shellcheck shell=powershell

# Function to convert a number to IPv4 mask format
function ConvertToIPv4Mask {
    param(
        [string]$number
    )

    # $mask = [Convert]::ToInt32(('1' * $number.PadLeft(8, '0').Length), 2)
    $mask = [Math]::Pow(2, 32) - [Math]::Pow(2, 32 - $number)
    $ipMask = [IPAddress]$mask

    return $ipMask.ToString()
}


$network_mask = $args[0]
if ($network_mask -match '^(\d|[12]\d|3[012])$') {
    $ipv4Mask = ConvertToIPv4Mask $network_mask
    Write-Output $ipv4Mask
} else {
    Write-Output "Input string does not match the required format."
}