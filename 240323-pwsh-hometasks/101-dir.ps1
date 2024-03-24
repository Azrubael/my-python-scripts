<#
Write a script to list directory that contain files. Output is the same with Get-ChildItem cmdlet. Print file size in kilobytes (Kb). The directory to list will be passed as a parameter whent the script will run.
c:\> .\ListFilesInDirectory.ps1 -directoryPath "C:\YourDirectoryPath"
#>

param (
    [string]$directoryPath
)

# Get the list of directories containing files
$directories = Get-ChildItem -Path $directoryPath -Depth 1 -Recurse
# Loop through each directory
foreach ($dir in $directories) {
    Write-Host "Directory: $($dir.FullName)"
    
    # Get the files within the directory
    $files = Get-ChildItem -Path $dir.FullName

    # Loop through each file
    foreach ($file in $files) {
        $fileSizeKB = [math]::Round(($file.Length / 1KB), 2)
        Write-Host "`tFile: $($file.Name), Size: $fileSizeKB KB"
    }
}