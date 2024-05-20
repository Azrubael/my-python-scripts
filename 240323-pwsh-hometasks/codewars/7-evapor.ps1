# shellcheck shell=powershell

<#
This program tests the life of an evaporator containing a gas.
    We know the content of the evaporator (content in ml), the percentage of foam or gas lost every day (evap_per_day) and the threshold (threshold) in percentage beyond which the evaporator is no longer useful. All numbers are strictly positive.
The program reports the Nth day (as an integer) on which the evaporator will be out of use.
Example:        evaporator(10, 10, 5) -> 29
#>

function evaporator_opt {
    param (
        [single]$v,
        [single]$e,
        [single]$h
    )

    $m = $v * $h / 100
    $Nth = [math]::Floor( [math]::log($m/$v) / [math]::log(1-$e/100) + 1 )
    [int]$Nth
}


# Check if three arguments is provided
if ($args.Count -lt 3) {
    $n = 0
} elseif ($args[0] -as [single] `
    -and $args[1] -as [single] `
    -and $args[2] -as [single]) {
    $n = @($args[0], $args[1], $args[2])
} else {
    $n = 0
}

if ($n -eq 0) {
    Write-Host "You have to provide three numeric arguments."
    Write-Host "Usage: powershell scriptname.ps1 <number1 number2 number3>"
    exit 2
}


# Calls the function
Write-Host "The first test: " -NoNewline
evaporator_opt -v 10 -e 10 -h 5
Write-Host "The second test: " -NoNewline
evaporator_opt -v 5 -e 10 -h 2
Write-Host "The actual result: " -NoNewline
evaporator_opt -v $n[0] -e $n[1] -h $n[2]

