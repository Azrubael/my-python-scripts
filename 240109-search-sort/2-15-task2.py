"""
Чтобы перевернуть слово, поместите данное слово в стек (букву за буквой), а затем извлеките буквы из стека.
"""

word = input("Please enter the word or string: ")
stack = []
for letter in word:
    stack.append(letter)
reversed_word = ''
while stack:
    reversed_word += stack.pop()
print("Reversed: {}".format(reversed_word))