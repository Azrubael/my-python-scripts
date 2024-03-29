<#
A script to analyse a specific text file passed as an argument, to get 10 longest words chart and put them in the separate new file with name "<oldnname>_chart.txt".
Уou can run the script in PowerShell by providing the path to the text file you want to analyze as an argument:
.\11-1-task.ps1 -filePath "C:\Path\To\Your\File.txt"
#>

param (
    [string]$filePath
)

if (-not $filePath) {
    Write-Host "Please provide the file path as an argument."
    exit
}

$text = Get-Content $filePath -Raw

# Define a regular expression pattern to match words with one or more characters
$pattern = "\b\w+\b" 

# Find all words matching the pattern
$words = [Regex]::Matches($text, $pattern) | ForEach-Object { $_.Value }

# Find the longest word
$longestWord = ($words | Sort-Object { $_.Length } -Descending)[0]

# Get the 10 longest words as a hash table
$top10HashTable = @{}
$words | Sort-Object { $_.Length } -Descending | Select-Object -First 10 | ForEach-Object {
    $top10HashTable[$_] = $_.Length
}

# Create a chart with the 10 longest words
$chart = $top10HashTable.GetEnumerator() | ForEach-Object { "{0}: {1}" -f $_.Key, $_.Value }

# Create a new file name for the chart
$chartFileName = $filePath + '_chart.txt'

# Write the chart to the new file
$chart | Out-File -FilePath $chartFileName

Write-Host "Longest Word: $longestWord"
Write-Host "Chart with the 10 longest words has been saved to: $chartFileName"