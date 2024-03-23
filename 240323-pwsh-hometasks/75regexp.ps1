<#
Write a script to find all words which are at least 6 characters long in a string.

# Example 1
.\task5.ps1 "Tue Sep 15 2020 15:39:48 GMT+0300 (Belarus Local Time)"
# Returns
Belarus
#>

param(
    [string]$inptString
)

# Define a regular expression pattern to match words of at least 6 characters
$pattern = "\b\w{6,}\b"

# Use Select-String to find all matches in the input string
$res = $inptString | Select-String -Pattern $pattern -AllMatches

# Output the matched words
$res.Matches.Value