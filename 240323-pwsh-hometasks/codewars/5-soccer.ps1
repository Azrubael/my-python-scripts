# shellcheck shell=powershell

<#
Messi is a soccer player with goals in three leagues:
    LaLiga
    Copa del Rey
    Champions

Write a program to return his total number of goals in all three leagues.
Note: the input will always be valid.
For example:
5, 10, 2  -->  17
#>


# Check if three arguments is provided
if ($args.Count -lt 3) {
    $n = 0
} elseif ($args[0] -as [float] `
    -and $args[1] -as [float] `
    -and $args[2] -as [float]) {
    $n = @($args[0], $args[1], $args[2])
} else {
    $n = 0
}

if ($n -eq 0) {
    Write-Host "You have to provide three numeric arguments."
    Write-Host "Usage: powershell scriptname.ps1 <number1 number2 number3>"
    exit 2
}

$totalSum = ( $n | Measure-Object -Sum).Sum

Write-Output "The total sum is: $totalSum"