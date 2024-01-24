utf8_pattern = [
    (65,'A'), (66,'B'), (67,'C'), (68,'D'), (69,'E'),
    (70,'F'), (71,'G'), (72,'H'), (73,'I'), (74,'J'),
    (75,'K'), (76,'L'), (77,'M'), (78,'N'), (79,'O'),
    (80,'Q'), (81,'P'), (82,'R'), (83,'S'), (84,'T'),
    (85,'U'), (86,'V'), (87,'W'), (88,'X'), (89,'Y'),
    (90,'Z'),
    (97,'a'), (98,'b'), (99,'c'), (100,'d'), (101,'e'),
    (102,'f'), (103,'g'), (104,'h'), (105,'i'), (106,'j'),
    (107,'k'), (108,'l'), (109,'m'), (110,'n'), (111,'o'),
    (112,'p'), (113,'q'), (114,'r'), (115,'s'), (116,'t'),
    (117,'u'), (118,'v'), (119,'w'), (120,'x'), (121,'y'),
    (122,'z')
    ]

def encryptor(text, shift):
    cipher = ''
    table_length = len(utf8_pattern)
    for char in text:
        for index, (_, symbol) in enumerate(utf8_pattern):
            if char.isalpha() and char == symbol:
                i = index + shift
                if i > table_length - 1:
                    i = i - table_length
                cipher += utf8_pattern[i][1]
                break
        else:
            cipher += char

    return cipher


def decryptor(cipher, shift):
    text = ''
    table_length = len(utf8_pattern)
    for char in cipher:
        for index, (_, symbol) in enumerate(utf8_pattern):
            if char.isalpha() and char == symbol:
                i = index - shift
                text += utf8_pattern[i][1]
                break
        else:
            text += char       
    
    return text


def ask_about_mode():
    choise = True
    result = None
    while choise:
        letter = input("Do You want to Encrypt/Decrypt/Quit? [e/d/q]: ")
        if not letter[0].isalpha():
            continue
        else:
            result = letter[0].lower()
            if result in ['e', 'd', 'q']:
                choise = False

    return result


def ask_about_shift():
    choise = True
    result = 1
    while choise:
        letter = input("Enter the shift value [1...25]: ")
        try:
            result = int(letter)
            if result in range(1,26):
                choise = False
        except ValueError:
            print("Please enter an INTEGER number in the range of [1..25]: ")

    return result


def main():
    whats_up = ask_about_mode()
    if whats_up == 'e':
        text = input("Enter your message: ")
        print("Your chipher,\n" + encryptor(text, ask_about_shift()))
    elif whats_up == 'd':
        text = input("Enter your cipher: ")
        print("Your encrypted text is,\n" + decryptor(text, ask_about_shift()))
    else:
        quit()


if __name__ == '__main__':
    main()


