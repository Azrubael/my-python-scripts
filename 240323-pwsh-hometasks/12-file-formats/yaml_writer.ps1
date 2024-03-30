<#
A script to get list of processes (for example all firefox processes) and put Name, Id, StartTime, PagedMemorySize in text file "firefox<CurrentTime>.yaml" in the current directory.
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


# $firefoxProcesses = Get-Process | Where-Object { $_.ProcessName -eq "firefox" }
$processes = Get-Process -Name "firefox*"

$currentTimestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$fullFileName = "firefox$currentTimestamp.yaml"

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

$processInfo | ConvertTo-Yaml | Out-File -FilePath "$fullFileName"

Write-Host "A file created for process: $fullFileName"