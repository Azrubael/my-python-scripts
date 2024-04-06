# 2024-03-31    18:13
=====================


# PowerShell Functions Parameters
---------------------------------

Types of parameters:
• Named
• Positional
• Switch
• Dynamic


# Example1 - Named parameters:
```PowerShell
function Show-ParamExample1 {
    param( $Parameter )
    Write-Host "You passed $Parameter as a function parameter"
}
```
> Show-ParamExample1 -Parameter "Some Parameter"
You passed Some Parameter as a function parameter


# Example2 - Named parameters with default value:
```PowerShell
function Show-ParamExample2 {
    param( $Parameter = "Default Value" )
    Write-Host "You passed $Parameter as a function parameter"
}
```
> Show-ParamExample2
You passed Default Value as a function parameter


# Example3 - Positional parameters:
```PowerShell
function Get-PositionalParam {
    Write-Host -ForegroundColor blue "The first argument was $($args[0])
    Write-Host -ForegroundColor cyan "The second argument was $($args[1])
}
```
> Get-PositionalParam '1st' '2nd'
The first argument was 1st
The second argument was 2nd


# Example4 - Switch parameters:
```PowerShell
function Get-SwitchExampe4 {
    param ( [switch]$SwitchParameter )
    if ($SwitchParameter) {
        Write-Host -ForegroundColor Green "Switch parameter was added"
    } else {
        Write-Host -ForegroundColor Red "Switch parameter wasn't added
    }
}
```
> Set-SwitchExampe4 -SwitchParameter
Switch parameter was added

