# Sample array of hash tables
$arrayOfHashTables = @(
    @{
        Name = "Alice"
        Age = 30
        Location = "New York"
    },
    @{
        Name = "Bob"
        Age = 25
        Location = "Los Angeles"
    }
)

$flattenedArray = $arrayOfHashTables | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        Age = $_.Age
        Location = $_.Location
    }
}

$csvString = $flattenedArray | ConvertTo-Csv -NoTypeInformation

$csvString | Out-File -FilePath "output.csv"