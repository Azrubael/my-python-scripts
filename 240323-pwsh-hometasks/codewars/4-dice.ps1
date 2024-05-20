# shellcheck shell=powershell

<#
In this game, the hero moves from left to right. The player rolls the dice and moves the number of spaces indicated by the dice two times.
Create a function for the powershell game that takes as argument the current position of the hero, then roll the dice (from 1 to 6) and then return the new position.
#>

function RollDiceAndUpdatePosition {
    param(
        [int]$currentPosition
    )

    $diceRoll = Get-Random -Minimum 1 -Maximum 7
    $newPosition = $currentPosition + $diceRoll

    [PSCustomObject]@{
        NewPosition = $newPosition
        DiceRoll = $diceRoll
    }
}

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

$result = RollDiceAndUpdatePosition -currentPosition $n
Write-Output "Hero's current position: $n"
Write-Output "Dice roll: $($result.DiceRoll)"
Write-Output "Hero's new position: $($result.NewPosition)"