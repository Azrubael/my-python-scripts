<#
A powershell function that will get any array from the pipeline
#>


function Get-ValueFromPipe {
    process {
        foreach ($value in $_) {
            Write-Output "Value from pipe: $value"
        }
    }
}

Write-Host "`nThe first pipeline:"
1..3 | Get-ValueFromPipe
Write-Host "`n`nThe second pipeline:"
@("First element", "Second element", "Third element") | Get-ValueFromPipe