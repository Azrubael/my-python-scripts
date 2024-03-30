<#
A powershell script to read the passed name of the json file, convert the data into hash table and print it on the display.
You can run it in PowerShell by passing the YAML file name as a parameter:
> .\12-2yaml-task.ps1 "firefox-process\firefox20240330_130216.yaml"
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


# Read the YAML file line by line and parse it into a hash table
$data = @()
$yamlData = @{}
$inProcessInfo = $false

Get-Content -Path $FileName | ForEach-Object {
    $line = $_.Trim()
    if ($line -eq "- ProcessInfo:") {
        $inProcessInfo = $true
    } elseif ($line -eq "") {
        $inProcessInfo = $false
        $data += $yamlData
        $yamlData = @{}
    } elseif ($inProcessInfo) {
        $keyValue = $line -split ":"
        $key = $keyValue[0].Trim()
        $value = $keyValue[1].Trim()
        $yamlData[$key] = $value
    }
    
}

# Add the last entry to the data array
$data += $yamlData

# Convert the data array into a JSON object with specific fields
$jsonData = $data | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        Id = $_.Id
        StartTime = $_.StartTime
        PagedMemorySize = $_.PagedMemorySize
    } | ConvertTo-Json
}

# Convert the JSON object to a hash table
$hashTable = $jsonData | ConvertFrom-Json

# Display the hash table data
$hashTable