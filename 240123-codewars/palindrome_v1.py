text = input("Please input a some text string: ")
string = text.lower().replace(" ", "")

palindrome = ''

for i in range(len(string) // 2):
    if string[i] != string[-i-1]:
        palindrome = "n\'t"
        break

print(f"The entered above text is{palindrome} a palindrome.")