Function Get-ComputerInformation {
    [CmdletBinding()]
    PARAM ($ComputerName)
    
    # Computer System
    $ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName
    # Opetating System
    $OperatingSystem = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Computername
    # BIOS
    $Bios = Get-WmiObject -Class win32_BIOS -ComputerName $ComputerName

    $Properties = @{
        ComputerName = $ComputerName
        Menufacturer = $ComputerSystem.Manufacturer
        Model = $ComputerSystem.Model
        OperatingSystem = $OperatingSystem.Caption
        OperatingSystemVersion = $OperatingSystem.Version
        SerialNumber = $Bios.SerialNumber
    }

    # Output the information
    New-Object -TypeName PSObject -Property $Properties
}