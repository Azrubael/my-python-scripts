<#
Write a PowerShell script that it makes association with running services and process in Windows. Put result in hash table. Use pipelines as match as possible.
#>

# Get running services
$services = Get-Service | Where-Object { $_.Status -eq "Running" }

# Get associated processes for each service
$serviceProcesses = $services | ForEach-Object {
    $service = $_
    $processes = Get-WmiObject Win32_Service | Where-Object { $_.Name -eq $service.Name } | ForEach-Object {
        Get-Process -Id $_.ProcessId
    }
    [PSCustomObject]@{
        ServiceName = $service.Name
        Processes = $processes
    }
}

# Create a hash table to store the association
$serviceProcessHashTable = @{}
$serviceProcesses | ForEach-Object {
    $serviceProcessHashTable[$_.ServiceName] = $_.Processes
}

# Output the hash table
$serviceProcessHashTable