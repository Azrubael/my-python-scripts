<#
Write a script to convert a date of mm-dd-yyyy format to dd-mm-yyyy format.

# Example 1
.\task4.ps1 "09-17-1991"
# Returns
17-09-1991
#>

param(
    [string]$inptDate
)

# Split the input date using the '-' separator
$dateParts = $inptDate -split "-"

# Rearrange the date parts to form the dd-mm-yyyy format
$res = $dateParts[1] + "-" + $dateParts[0] + "-" + $dateParts[2]

# Output the converted date
$res