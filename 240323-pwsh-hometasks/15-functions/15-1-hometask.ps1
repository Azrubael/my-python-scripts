<#
A powershell function that will get a string and one of several switch parameters and return the text from string with the color passed with switch parameter.
#>

function Write-ColoredMessage {
    param(
        [string]$Text,
        [switch]$Red,
        [switch]$Blue
    )

    $color = "White"  # Default color
    if ($Red) {
        $color = "Red"
    } 
    elseif ($Blue) {
        $color = "Blue"
    }

    Write-Host $Text -ForegroundColor $color
}

Write-ColoredMessage -Text "Hello, Red color!" -Red
Write-ColoredMessage -Text "Hello, Blue color!" -Blue