<#
A script to get from selected remote computer the following data:
- CPU model and max clock speed;
- Amount of RAM (total and free);
- OS disk free space;
- OS version;
- Installed hot fixes;
- List of stopped services.
#>

$ComputerName = "localhost" # "REMOTE_COMPUTER_NAME"

# Get CPU information
$cpuInfo = Get-WmiObject Win32_Processor -ComputerName $ComputerName
$cpuModel = $cpuInfo.Name
$cpuMaxClockSpeed = $cpuInfo.MaxClockSpeed

# Get RAM information
$ramInfo = Get-WmiObject Win32_ComputerSystem -ComputerName $ComputerName
$totalRAM = [math]::Round($ramInfo.TotalPhysicalMemory / 1GB, 2)
$freeRAM = [math]::Round($ramInfo.FreePhysicalMemory / 1GB, 2)

# Get OS information
$osInfo = Get-WmiObject Win32_OperatingSystem -ComputerName $ComputerName
$osVersion = $osInfo.Caption
$osDiskFreeSpace = [math]::Round($osInfo.FreeSpace / 1GB, 2)

# Get installed hotfixes
$hotfixes = Get-HotFix -ComputerName $ComputerName

# Get list of stopped services
$stoppedServices = Get-Service -ComputerName $ComputerName | Where-Object { $_.Status -eq "Stopped" }

# Display the collected information
Write-Host "Computer: $ComputerName"
Write-Host "CPU Model: $cpuModel"
Write-Host "Max Clock Speed: $cpuMaxClockSpeed MHz"
Write-Host "Total RAM: $totalRAM GB"
Write-Host "Free RAM: $freeRAM GB"
Write-Host "OS Version: $osVersion"
Write-Host "OS Disk Free Space: $osDiskFreeSpace GB"
Write-Host "Installed Hotfixes:"
$hotfixes | Format-Table -AutoSize
Write-Host "Stopped Services:"
$stoppedServices | Select-Object DisplayName, Status | Format-Table -AutoSize
