<#
A script to sort words in alphabet order from specific file and put them into 26 text files named A.txt, B.txt, and so on up to Z.txt.
Уou can run the script in PowerShell by providing the path to the text file you want to analyze as an argument:
.\11-2-task.ps1 -filePath "C:\Path\To\Your\File.txt"
#>

param (
    [string]$filePath
)

if (-not $filePath) {
    Write-Host "Please provide the file path as an argument."
    exit
}

$text = Get-Content $filePath -Raw

# Define a regular expression pattern to match words containing Latin characters
# $latinPattern = "\b[a-zA-Z]+\b"
$pattern = "\b\w+\b"

# Find all words matching the pattern
$words = [Regex]::Matches($text, $pattern) | ForEach-Object { $_.Value }
# $latinWords = [Regex]::Matches($text, $latinPattern) | ForEach-Object { $_.Value }

# Create a hash table with words and their counts
$wordCount = @{}
$words | ForEach-Object {
    $word = $_.ToLower()
    if ($wordCount.ContainsKey($word)) {
        $wordCount[$word]++
    } else {
        $wordCount[$word] = 1
    }
}

# Sort the hash table in alphabetical order
$sortedWordCount = $wordCount.GetEnumerator() | Sort-Object Name

# Create a directory for the words
$directoryName = $filePath + '_words'
$index = 1
while (Test-Path $directoryName) {
    $directoryName = $filePath + "_words_$index"
    $index++
}
New-Item -ItemType Directory -Path $directoryName | Out-Null

# Save words in separate text files based on the starting letter
$miscFile = Join-Path $directoryName "misc.txt"
$sortedWordCount | ForEach-Object {
    $firstLetter = $_.Name.Substring(0, 1).ToUpper()
    if ($firstLetter -match "[A-Z]") {
        $file = Join-Path $directoryName "$firstLetter.txt"
    } else {
        $file = $miscFile
    }
    $_.Name | Out-File -FilePath $file -Append
}

Write-Host "Words have been sorted and saved in the directory: $directoryName"