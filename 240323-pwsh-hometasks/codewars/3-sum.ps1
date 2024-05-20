# shellcheck shell=powershell
### Calculate the sum of a set of numbers 


# Check if the first argument is provided
if ($args.Count -eq 0) {
    $n = 0
} elseif ($args[0] -is [int] -and $args[0] -ne 0) {
    $n = $args[0]
} else {
    $n = 0
}

if ($n -eq 0) {
    Write-Host "You have to provide a positive integer argument."
    Write-Host "Usage: powershell scriptname.ps1 <integer>"
    exit 2
}


$result = $n * ( $n + 1 ) / 2
$result