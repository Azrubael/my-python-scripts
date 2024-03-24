Write-Host "Blue text from file script" -ForegroundColor Blue

$colors = @("green", "blue", "red", "yellow")
for ($i=0; i -lt $colors.:ength; $i++) {
    Write-Host $colors[$i] -ForegroundColor $colors[$i]
}