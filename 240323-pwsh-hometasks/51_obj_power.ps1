class MyCustomObject {
    [int] Pow([int]$base, [int]$exponent) {
        return [math]::Pow($base, $exponent)
    }
}

$MyCustomObject = [MyCustomObject]::new()
$first = $MyCustomObject.Pow(2,3)
$second = $MyCustomObject.Pow(7,2)
Write-Host "2**3 =" $first
Write-Host "7**2 =" $second