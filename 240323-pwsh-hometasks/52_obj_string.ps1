class MyCustomObject {
    [string] $inputString

    [void] SetString([string]$input) {
        $this.inputString = $input
    }

    [void] PrintString() {
        Write-Host $this.inputString.ToUpper()
    }
}

$MyCustomObject = [MyCustomObject]::new()

$MyCustomObject.SetString("You shall not pass!")
$MyCustomObject.PrintString()