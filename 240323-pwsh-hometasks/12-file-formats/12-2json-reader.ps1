<#
A powershell script to read the passed name of the json file, convert the data into hash table and print it on the display.
You can run it in PowerShell by passing the JSON file name as a parameter:
> .\12-2json-task.ps1 "firefox-process\firefox20240330_130216.json"
#>

$fileName = $args[0]

if (-not $fileName) {
    Write-Host "Please provide the file name as a parameter."
    Exit
}

if (-not (Test-Path $fileName)) {
    Write-Host "File not found: $fileName"
    Exit
}

# Read the CSV file and convert it to a hash table
$hashTable = Get-Content -Path $fileName | ConvertFrom-Json

$hashTable