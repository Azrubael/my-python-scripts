<#
Write a script to sort a list of elements using the bubble sort algorithm. Make output in console for each sort steps and could be controlled by Verbose parameter (user can choose if he would like to see output).
#>

param (
    [string[]]$Elements,
    [switch]$Verbose
)

function BubbleSort([string[]]$arr) {
    $n = $arr.Length
    for ($i = 0; $i -lt $n; $i++) {
        for ($j = 0; $j -lt $n - $i - 1; $j++) {
            if ($arr[$j] -gt $arr[$j + 1]) {
                $temp = $arr[$j]
                $arr[$j] = $arr[$j + 1]
                $arr[$j + 1] = $temp

                if ($Verbose) {
                    Write-Host "Step $($i + 1): $($arr -join ', ')"
                }
            }
        }
    }
    return $arr
}

# Display the input elements
Write-Host "Input Elements: $($Elements -join ', ')"

# Sort the elements using Bubble Sort
$sortedElements = BubbleSort -arr $Elements

# Display the sorted elements
Write-Host "Sorted Elements: $($sortedElements -join ', ')"