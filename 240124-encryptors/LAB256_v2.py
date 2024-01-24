text = input("Enter a message: ")
shift = 1
cipher = ''
choise = True

while choise:
    shift = input("Enter a shift [1-25]: ")
    try:
        shift = int(shift)
        if shift in range(1,26): choise = False
    except ValueError:
        print("Wrong input of an integer value.")

for char in text:
    if not char.isalpha():
        cipher += char
        continue
    code = ord(char)
    if code < 91:
        first = 65
    else:
        first = 97
    new_code = code + shift
    if new_code > first + 25:
        new_code -= 26
    cipher += chr(new_code)

print(cipher)