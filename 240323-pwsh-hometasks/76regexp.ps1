<#
Write a script to remove multiple spaces in a string.

# Example 1
.\task6.ps1 " kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m"
# Returns
kube-system coredns-869cb84759-drhbg 1/1 Running 0 4h5m
#>

param(
    [string]$inpString
)

# Replace multiple spaces with a single space using regular expression
$res = $inpString -replace '\s+',' '

# Output the string with multiple spaces removed
$res