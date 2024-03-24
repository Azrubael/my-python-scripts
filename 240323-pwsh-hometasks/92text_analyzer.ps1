<#
Write a script to find the occurrences of 10 most common words in a given text.
Use any article from Wikipedia as given text. Use pipelines as match as possible.
#>

$text = @"
Due to its lighter weight and thus greater speed, the caravel was a boon to sailors. Early caravels generally carried two or three masts with lateen sails, while later types had four masts.
Early caravels such as the caravela tilhlda of the 15th century had an average length of between 12 and 18 m (39 and 59 ft), an average capacity of 50 to 60 tons,[5] a high length-to-beam ratio of around 3.5 to 1, and narrow ellipsoidal frame (unlike the circular frame of the nau), making them very fast and maneuverable but with somewhat low capacity.
It was in such ships that Christopher Columbus set out on his expedition in 1492; Santa María was a nau of about 100 tons which served as the flagship and the Pinta and Niña were smaller caravels of around 15–20 m with a beam of 6 m and displacing around 60–75 tons. 
"@

# Remove special characters and convert text to lowercase
$cleanedText = $text -replace '\W', ' ' -split '\s+' | ForEach-Object { $_.ToLower() }

# Count the occurrences of each word
$wordCounts = $cleanedText | Group-Object | Sort-Object Count -Descending | Select-Object -First 10

# Output the 10 most common words and their occurrences
$wordCounts