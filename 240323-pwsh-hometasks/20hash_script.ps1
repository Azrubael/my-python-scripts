# Create hash table with pre-defined key-value pairs
$hashtable1 = @{
    "dog" = "bark-bark"
    "cat" = "meow"
    "goose" = "ga-ga-ga"
}

Write-Host "This is hashtable1: "
$hashtable1
Write-Host "This is hashtable1[`cat`]: "
$hashtable1["cat"]
Write-Host "This is hashtable1.dog: " $hashtable1.dog

# Create an ampty hash table and add key-value pair to it
$hashtable2 = @{}
$hashtable2.Add("dog", "bark-bark")

# Retrieve values from hash table by key
Write-Host "This is the value of hashtable2.dog: "
$hashtable2["dog"]
$hashtable2."dog"
