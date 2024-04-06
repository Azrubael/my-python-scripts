<#
A function to work with different parameters
$ . .\FunctionAndParametersDemo.ps1
$ Write-Strings -CustomString "Custom String" -UpperCase -Count 5
CUSTOM STRING
CUSTOM STRING
CUSTOM STRING
CUSTOM STRING
CUSTOM STRING

$ Write-Strings -CustomString "Custom String"
Custom String
Custom String
Custom String
#>


function Write-Strings {
    param (
        [switch]$UpperCase,
        [string]$CustomString,
        [int]$Count = 3
    )
    
    if ($UpperCase) {
        1..$Count | ForEach-Object {Write-Host $CustomString.ToUpper()}
    } else {
        1..$Count | ForEach-Object {Write-Host $CustomString}
    }
}