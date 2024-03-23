<#
Write a script that matches a word at the end of string.

# Example 1
.\task2.ps1 "Ents or talking trees are derived from the Old English word for giant"
# Returns
giant
#>

param(
    [string]$inpt
)

# Define the regex pattern to match a word at the end of the string
$pattern = "\b\w+$"

# Use Select-String to find the match
$res = $inpt | Select-String -Pattern $pattern | ForEach-Object { $_.Matches.Value }

# Output the match
$res