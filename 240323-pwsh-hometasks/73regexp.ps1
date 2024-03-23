<#
Write a script that matches an IP address.

# Example 1
.\task3.ps1 "Reply from 10.8.216.77: bytes=32 time<1ms TTL=128"
# Returns
10.8.216.77
#>

param(
    [string]$inpt
)

# Define the regex pattern to match an IP address
$pattern = "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"

# Use Select-String to find the match
$res = $inpt | Select-String -Pattern $pattern | ForEach-Object { $_.Matches.Value }

# Output the match
$res