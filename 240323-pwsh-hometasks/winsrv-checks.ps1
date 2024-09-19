# Get the total memory usage of all processes, you can sum the working set of all processes:

$TotalMemory = (Get-Process | Measure-Object -Property WorkingSet -Sum).Sum
$TotalMemoryMB = [math]::round($TotalMemory / 1MB, 2)
Write-Output "Total Memory Usage: $TotalMemoryMB MB"

# Get information about the system's memory:

Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
