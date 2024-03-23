<#
Create a new sorted string using two strings with random characters in them. Strings contains only latin letters from a to z.
# Example :
$str1 = "xyaabbbccccdefww"
$str2 = "xxxxyyyyabklmopq"
# Result
"abcdefklmopqwxy"
#>


$str1 = "xyaabbbccccdefww"
$str2 = "xxxxyyyyabklmopq"

# Concatenate the two strings and convert them to a character array
$combinedArray = @($str1.ToCharArray() + $str2.ToCharArray())

# Remove duplicates by using the -join operator and then splitting it back into an array
$sortedString = ($combinedArray | Select-Object -Unique | Sort-Object) -join ""

# Output the result
$sortedString