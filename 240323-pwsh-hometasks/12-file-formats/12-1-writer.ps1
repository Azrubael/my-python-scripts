<#
A script to get list of process (for example all firefox process) and put Name, Id, StartTime, PagedMemorySize in text files "firefox<CurrentTime>.*" of CSV/XML/JSON/YAML format in a new directory "firefox-process".
#>

function ConvertTo-Yaml {
    # Function to convert PowerShell object to YAML format
    param (
        [Parameter(ValueFromPipeline = $true)]
        [Object]$InputObject
    )

    Begin {
        $i = 0
        $indentString = "  "
    }

    Process {
        $yaml = @()
        $yaml = "- ProcessInfo`:`n"
        $i++
        foreach ($key in $InputObject.Keys) {
            $value = $InputObject[$key]
            $indent = $indentString * $i
            $yaml += "$indent$indent$key`:` $value`n"
        }
        $i--
        $yaml -join "`n"
    }
}


$directoryName = "firefox-process"
if (!(Test-Path $directoryName)) {
    New-Item -ItemType Directory -Path $directoryName
}

# $firefoxProcesses = Get-Process | Where-Object { $_.ProcessName -eq "firefox" }
$processes = Get-Process -Name "firefox*"

$currentTimestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$fullFileName = "$directoryName\firefox$currentTimestamp"

# Loop through each Firefox process and save the required information in different file formats
$processInfo = @()
foreach ($process in $processes) {
    $processInfo += @{
        Name = $process.ProcessName
        Id = $process.Id
        StartTime = $process.StartTime
        PagedMemorySize = $process.PagedMemorySize
    }
}

$flattenedArray = $processInfo | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        Id = $_.Id
        StartTime = $_.StartTime
        PagedMemorySize = $_.PagedMemorySize
    }
}

$flattenedArray | ConvertTo-Csv -NoTypeInformation |  Out-File -FilePath "$fullFileName.csv"
$processInfo | ConvertTo-Xml -As String | Out-File -FilePath "$fullFileName.xml"
# $processInfo | ConvertTo-Xml  -NoTypeInformation | Select-Object -ExpandProperty OuterXml | Out-File -FilePath "$fullFileName.xml"
$processInfo | ConvertTo-Json | Out-File -FilePath "$fullFileName.json"
$processInfo | ConvertTo-Yaml | Out-File -FilePath "$fullFileName.yaml"

Write-Host "Files created for process $($process.ProcessName) with ID $($process.Id):"
Write-Host "CSV: $fullFileName.csv"
Write-Host "XML: $fullFileName.xml"
Write-Host "JSON: $fullFileName.json"
Write-Host "YAML: $fullFileName.yaml"