"""
A function, which behaves almost exactly like the original split() method, i.e.:
1. it should accept exactly one argument – a string;
2. it should return a list of words created from the string, divided in the places where the string contains whitespaces;
3. if the string is empty, the function should return an empty list;
4. its name should be mysplit()
"""


def mysplit(strng):
    res = []
    word = ""
    for letter in strng:
        if letter not in " \n\t":
            word += letter
        else:
            if word != "":
                res.append(word)
                word = ""
    return res


def main():
    print(mysplit("To be or not to be, that is the question"))
    print(mysplit("To be or not to be,that is the question"))
    print(mysplit("   "))
    print(mysplit(" abc "))
    print(mysplit(""))


if __name__ == '__main__':
    main()


    