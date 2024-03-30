<#
A powershell script to read the passed name of the csv file, convert the data into hash table and print it on the display.
You can run it in PowerShell by passing the CSV file name as a parameter:
> .\12-2csv-task.ps1 "firefox-process\firefox20240330_130216.csv"
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
$hashTable = Import-Csv $fileName | ConvertTo-Json

$hashTable