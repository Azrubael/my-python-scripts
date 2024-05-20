# shellcheck shell=powershell

<#
A PowerShell script that:
- takes the filename of the CSV file as an argument,
- displays the content of the CSV file at the beginning of the script,
- parses the CSV file, considering it has four fields and the third field can contain two subfields delimited by commas,
- prints out the parsed data as a table.
#>

# Check if filename is provided as an argument
if ($args.Count -eq 0) {
    Write-Host "Usage: powershell scriptname.ps1 <filename.csv>"
    exit 1
}

$filename = $args[0]

if (-not (Test-Path $filename)) {
    Write-Host "File does not exist."
} else {
    $fileContent = Get-Content $filename -Raw
    if ($fileContent -match '\w') {
        Write-Host "File exists and contains text."
    } else {
        Write-Host "File exists but does not contain text."
        exit 1
    }
}

Write-Host "Content of $filename`:"
Write-Output "---------------------"
Get-Content $filename
Write-Output ""


# Parse the CSV file ##############################################
# Read the first line of the text file and create an array of words
$headers = $(Get-Content $filename -TotalCount 1) -split ','


# Read each line of the CSV file and store it in the two-dimensional array
$csv_data = @()
$H = $headers.Count
Get-Content $filename | Select-Object -Skip 1 | ForEach-Object {
    $line = $_ -split ","
    $csv_line = New-Object string[] $H
    for ($i=0; $i -lt $H; $i++) {
        if (($line.Count -ne $H) -and `
            ($($H-$i) -lt 2) -and `
            ($line[$i+1])) {
            $csv_line[$i] = $line[$i] + ", " + $line[$i+1]
        } else {
            $csv_line[$i] = $line[$i]
        }
    }
    $csv_data += , $csv_line
}


# Combine headers and lines into an array of objects
$csvObj = @()
foreach ($line in $csv_data) {
    try {
        $obj = [PSCustomObject]@{}
        for ($i = 0; $i -lt $H; $i++) {
            $obj | Add-Member -MemberType NoteProperty -Name $headers[$i] -Value $line[$i]
        }
        $csvObj += $obj
    } catch {
        Write-Output "Error creating object: $_"
    }
}


$csvObj | Format-Table
