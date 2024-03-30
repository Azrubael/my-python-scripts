<#
A powershell script to read the passed name of the xml file, convert the data into hash table and print it on the display.
You can run it in PowerShell by passing the XML file name as a parameter:
> .\12-2xml-flat.ps1 "firefox-process\firefox20240330_130216.xml"
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

# Load the XML file
[xml]$xmlData = Get-Content -Path $fileName

# Initialize an array to store the converted data
$data = @()

# Process each "Object" node in the XML
foreach ($object in $xmlData.Objects.Object) {
    $objectData = @{}
    
    foreach ($property in $object.Property) {
        $key = $property.Name
        $value = $property.InnerText
        $objectData[$key] = $value
    }

    $data += $objectData
}

# Convert the data array into a JSON object with specific fields
$jsonData = $data | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        Id = [int]$_.Id
        StartTime = [string]$_.StartTime
        PagedMemorySize = [int]$_.PagedMemorySize
    } | ConvertTo-Json
}

# Convert the JSON object to a hash table
$hashTable = $jsonData | ConvertFrom-Json

# Display the hash table data
$hashTable