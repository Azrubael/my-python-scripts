<#
Write a script to find sequences of lowercase letters joined with underscore or dash.

# Example 1
.\task1.ps1 "A Balrog is a powerful fictional monster in Middle-earth"
# Returns
Middle-earth

# Example 2
.\task1.ps1 "The symbol underscore, also called low_line or low dash."
# Returns
low_line
#>

param(
    [string]$inpt
)

# Define the regex pattern
$pattern = "\b[a-z]+[-_][a-z]+\b"

# Use Select-String to find matches
$outpt = $inpt | Select-String -Pattern $pattern -AllMatches | ForEach-Object { $_.Matches.Value }

# Output the matches
$outpt