class MyCustomObject {
    [string] Reverse([string]$InputStr) {
        $words = $InputStr -split ' '  # Split the input string into words
        [array]::Reverse($words)  # Reverse the order of the words
        return ($words -join ' ')  # Join the words back into a single string
    }
}

$MyCustomObject = [MyCustomObject]::new()

$newStr = $MyCustomObject.Reverse("Nostromo oxigen")
Write-Host $newStr