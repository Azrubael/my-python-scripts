""" Non - overlapping palindromic subsequence problem:
The task is to count the number of pairs of the non-overlapping palindromic sub-strings. 
- Create a left[] array, where left[i] stores the count of the number of palindromes to the left on the index i including i.
- Create a right[] array, where right[i] stores the count of the number of palindromes to the right on the index i including i.
- Iterate from 0 to length-1 and add left[i]*right[i+1]. The summation of it for every index will be the required number of pairs.
"""

N = 100

# Pre-processing function
def pre_process(dp, s):
	n = len(s)

	# Initially mark every position as false
	for i in range(n):
		for j in range(n):
			dp[i][j] = False
	for j in range(1, n + 1):

		# Iterate for every index with length j
		for i in range(n - j + 1):
			if (j <= 2):
				if (s[i] == s[i + j - 1]):
					dp[i][i + j - 1] = True
			elif (s[i] == s[i + j - 1]):
				dp[i][i + j - 1] = dp[i + 1][i + j - 2]


# Function to return the number of pairs
def countPairs(s):
	# Create the dp table initially
	dp = [[False for i in range(N)] 
				for j in range(N)]
	pre_process(dp, s)
	n = len(s)

	# Declare the left array
	left = [0 for i in range(n)]
	# Declare the right array
	right = [0 for i in range(n)]
	left[0] = 1

	# Count the number of palindrome pairs to the left
	for i in range(1, n):
		for j in range(i + 1):
			if (dp[j][i] == 1):
				left[i] += 1
	right[n - 1] = 1

	# Count the number of palindrome pairs to the right
	for i in range(n - 2, -1, -1):
		right[i] = right[i + 1]
		for j in range(n - 1, i - 1, -1):
			if (dp[i][j] == 1):
				right[i] += 1
	ans = 0
	# Count the number of pairs
	for i in range(n - 1):
		ans += left[i] * right[i + 1]

	return ans


s = "abacaba"
print(countPairs(s))
