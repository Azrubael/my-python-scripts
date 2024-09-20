# shellcheck shell=powershell
<#
In Windows PowerShell, you can use the Get-Process cmdlet to view a list of running processes, which is similar to the top utility in Linux:
while ($true) {
    Clear-Host
    Get-Process | Sort-Object CPU -Descending | Format-Table -AutoSize
    Start-Sleep -Seconds 10
}

OR:
#>

# Store the previous total CPU time

$previousTotalCPUTime = 0
$previousTime = Get-Date

while ($true) {

    Clear-Host

    # Get the number of logical processors
    $logicalProcessors = [Environment]::ProcessorCount
    $maxCPU = $logicalProcessors * 100  # Maximum CPU usage in percentage

    # Get the current total CPU time
    $currentTotalCPUTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue

    # Calculate the elapsed time since the last measurement
    $currentTime = Get-Date
    $elapsedTime = ($currentTime - $previousTime).TotalSeconds

    # Calculate the CPU usage for each process
    $processes = Get-Process | 
        Select-Object Id, ProcessName, 
            @{Name='CPU (%)'; Expression={[math]::round(($_.CPU / ($elapsedTime * $logicalProcessors) / 10), 2)}}, 
            @{Name='WS (Mb)'; Expression={[math]::round($_.WS / 1MB, 2)}}, SI, Handles | 
        Sort-Object 'WS (Mb)' -Descending

    # Display process information
    $processes | Format-Table -AutoSize

    # Calculate total CPU and WS usage
    $totalCPU = ($processes | Measure-Object -Property 'CPU (%)' -Sum).Sum
    $totalWS = ($processes | Measure-Object -Property 'WS (Mb)' -Sum).Sum

    # Display total CPU and WS usage
    Write-Host "====================================="
    Write-Host "Total CPU Usage: $([math]::round($totalCPU, 2)) % of maximum ($maxCPU %)"
    Write-Host "Total Working Set Usage: $([math]::round($totalWS, 2)) MB"

    # Update previous values for the next iteration
    $previousTotalCPUTime = $currentTotalCPUTime
    $previousTime = $currentTime

    Start-Sleep -Seconds 10
}
