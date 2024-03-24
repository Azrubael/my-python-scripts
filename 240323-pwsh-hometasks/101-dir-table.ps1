<#
Write a script to list directory that contain files. Output is the same with Get-ChildItem cmdlet. Print file size in kilobytes (Kb). The directory to list will be passed as a parameter whent the script will run.
c:\> .\ListFilesInDirectory.ps1 -directoryPath "C:\YourDirectoryPath"
#>

param (
    [string]$directoryPath
)

$directories = Get-ChildItem -Path $directoryPath -Directory

# Loop through each directory
foreach ($dir in $directories) {
    Write-Host "Directory: $($dir.FullName)"
    $files = Get-ChildItem -Path $dir.FullName

    # Create a table with file details for the first level depth
    $fileTable = @()
    foreach ($file in $files) {
        $fileSizeKB = [math]::Round(($file.Length / 1024), 2)
        
        $fileTable += [PSCustomObject]@{
            FileName = $file.Name
            SizeKB = $fileSizeKB
        }
    }
    
    # Display the file details in table form
    $fileTable | Format-Table -AutoSize
}