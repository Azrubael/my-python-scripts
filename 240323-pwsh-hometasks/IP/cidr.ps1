# shellcheck shell=powershell

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

$Mask = "22"

$subnet = Convert-CIDRtoMask $Mask

Write-Output $subnet