class MyObj {
    [string] ReverseWords([string]$inputStr) {
        $words = $inputStr -split ' '  # Split the input string into words
        $reversedWords = foreach ($word in $words) {
            [char[]]$reversedWord = $word.ToCharArray()
            [array]::Reverse($reversedWord)  # Reverse each word
            -join $reversedWord
        }
        return ($reversedWords -join ' ')  # Join the reversed words back into a single string
    }
}

$MyCustomObject = [MyObj]::new()

$newStr = $MyCustomObject.ReverseWords("Nostromo oxigen")
Write-Host $newStr