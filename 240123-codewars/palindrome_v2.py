text = input("Please input a some text string: ")
text = text.replace(" ", "")

palindrome = ''

if len(text) > 1 and text.upper() == text[::-1].upper():
	print("It's a palindrome")
else:
	print("It's not a palindrome")
