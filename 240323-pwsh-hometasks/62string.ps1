<#
Write a script that converts dash/underscore delimited words into camel and pascal casing.

# Example 1
$initString = "the-stealth-warrior"
# Result
"theStealthWarrior"

# Example 2
$initString = "The_Stealth_Warrior"
# Result
"TheStealthWarrior"
#>

function ConvertToCamelCase {
    param(
        [string]$initString
    )

    $words = $initString -split '[-_]'
    $arr = $words[0]

    # Capitalize the first letter of each word and combine them
    foreach ($word in $words[1..($words.length-1)]) {
        $arr = $arr + $word.substring(0,1).toupper() + $word.substring(1)
    } 
    $result = [System.String]::Join($null, $arr)

    return $result
}

function ConvertToPascalCase {
    param(
        [string]$initString
    )

    $words = $initString -split '[-_]'
    # Capitalize the first letter of each word and combine them
    $arr = $words | ForEach-Object { $_.substring(0,1).toupper() + $_.substring(1) }
    $result = [System.String]::Join($null, $arr)

    return $result
}

# Example 1
$str = "the-stealth-warrior"
# Convert to camel case
ConvertToCamelCase -initString $str

# Example 2
$initString = "The_Stealth_Warrior"
# Convert to pascal case
ConvertToPascalCase -initString $str