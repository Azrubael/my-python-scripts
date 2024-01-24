# Numbers Summator.

line = input("Enter a line of numbers - separate them with spaces: ")
strings = line.replace(",",".").split()
try:
    total = sum([float(i) for i in strings])
    print("The total is:", total)
except:
    print(substr, "is not a number.")
    