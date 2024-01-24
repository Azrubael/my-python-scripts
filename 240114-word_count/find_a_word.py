""" A program which answers the following question: are the characters comprising the first string hidden inside the second string? """

short_txt = input("Enter the first string: ")
long_txt = input("Enter the second string: ")

txtS = short_txt.lower().strip()
txtL = long_txt.lower().strip()

dicS = dict()
dicL = dict()

for char in txtS:
    dicS[char] = dicS.get(char, 0) + 1

for char in txtL:
    dicL[char] = dicL.get(char, 0) + 1

for key in dicS:
    if dicL.get(key, 0) < dicS[key]:
        print('No')
        break
else:
    print('Yes')