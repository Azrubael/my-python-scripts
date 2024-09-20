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

while ($true) {
    Clear-Host

    # Get process information
    $processes = Get-Process | 
        Select-Object Id, ProcessName, CPU, @{Name='WS (Mb)'; Expression={[math]::round($_.WS / 1MB, 2)}}, SI, Handles | 
        Sort-Object 'WS (Mb)' -Descending

    # Display process information
    $processes | Format-Table -AutoSize

    # Calculate total CPU and WS usage
    $totalCPU = ($processes | Measure-Object -Property CPU -Sum).Sum
    $totalWS = ($processes | Measure-Object -Property 'WS (Mb)' -Sum).Sum

    # Display total CPU and WS usage
    Write-Host "====================================="
    Write-Host "Total CPU Usage: $([math]::round($totalCPU, 2)) seconds"
    Write-Host "Total Working Set Usage: $([math]::round($totalWS, 2)) MB"

    Start-Sleep -Seconds 10
}
