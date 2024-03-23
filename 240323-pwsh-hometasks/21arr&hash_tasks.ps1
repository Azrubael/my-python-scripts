<#
1. Create two-dimensional strong defined string array.
2. Put three different hash-tables in array. Retrieve value from the second key in third hash table in array.
3. Create nested hash-table and retrieve values by keys from it.
4. Transform hash-table into ordered hash-table sorted by value.
#>


# 1.
[string[]]$array = @( @("ab","cd","ef","йу"), @("zz","яя","рр","56") )
Write-Host "1. This is a two dimentional strong defined string array:"
$array


# 2.
$ht1 = @{
    "dog" = "bark-bark"
    "cat" = "meow"
    "goose" = "ga-ga-ga"
}
$ht2 = @{
    "auto" = "mobile"
    "moto" = "bike"
}
$ht3 = @{
    "sec" = "retary"
    "colo" = "nel"
    "part" = "ner"
    "robo" = "cop"
}
$array_of_hashes = @( $ht1, $ht2, $ht3 )

Write-Host " "
Write-Host "2. This is the values of the second keys of array_of_hashes: "
foreach ($hash in $array_of_hashes) {
    $secondKey = ($hash.GetEnumerator() | Select-Object -Index 1).Value
    Write-Host $secondKey
}

# 3. Create a nested hash-table with two elements and retrieve all the values by keys from it.
$nestedHashTable = @{
    "firstLevel" = @{
        "key11" = "value11"
        "key12" = "value12"
    }
    "firstLeve2" = @{
        "key21" = "value21"
        "key22" = "value22"
    }
}

Write-Host " "
Write-Host "3. This is the values got by keys from the nested nestedHashTable: "
# foreach ($innerHash in $nestedHashTable.Values) {
#     foreach ($value in $innerHash.Values) {
#         Write-Host $value
#     }
# }
# Retrieve values by keys from the nested hash-table
foreach ($elementKey in $nestedHashTable.Keys) {
    Write-Host "Element: $elementKey"
    $innerHash = $nestedHashTable[$elementKey]
    foreach ($innerKey in $innerHash.Keys) {
        $value = $innerHash[$innerKey]
        Write-Host "  $innerKey : $value"
    }
}

# 4. Transform hash-table into ordered hash-table sorted by value.
# Given a hash-table $ht3
$ht3 = @{
    "sec" = "retary"
    "colo" = "nel"
    "part" = "ner"
    "robo" = "cop"
}
$hashTable4 = @{a = 12; g = 4; h = 1; t = 7; d = 8}

# Create an ordered hash-table sorted by value
$orderedHashTable3 = [ordered]@{}
$ht3.GetEnumerator() | Sort-Object Value | ForEach-Object {
    $orderedHashTable3[$_.Key] = $_.Value
}

$orderedHashTable4 = [ordered]@{}
$hashTable4.GetEnumerator() | Sort-Object Value | ForEach-Object {
    $orderedHashTable4[$_.Key] = $_.Value
}

Write-Host " "
Write-Host " "
Write-Host "4. The hash-tables, sorted by value"
Write-Host "ht3 ---------------------------------------"
$orderedHashTable3
Write-Host " "
Write-Host "hashTable4 --------------------------------"
$orderedHashTable4

