
pattern = [
    [
    '###',
    '# #',
    '# #',
    '# #',
    '###'
    ],
    [
    '  #',
    '  #',
    '  #',
    '  #',
    '  #'
    ],
    [
    '###',
    '  #',
    '###',
    '#  ',
    '###'
    ],
    [
    '###',
    '  #',
    '###',
    '  #',
    '###'
    ],
    [
    '# #',
    '# #',
    '###',
    '  #',
    '  #'
    ],
    [
    '###',
    '#  ',
    '###',
    '  #',
    '###'
    ],
    [
    '###',
    '#  ',
    '###',
    '# #',
    '###'
    ],
    [
    '###',
    '  #',
    '  #',
    '  #',
    '  #'
    ],
    [
    '###',
    '# #',
    '###',
    '# #',
    '###'
    ],
    [
    '###',
    '# #',
    '###',
    '  #',
    '###'
    ]
]

user_input = input("Please enter an integer number: ")
str_with_patterns = []
for c in user_input:
    if not c.isdigit():
        print("The entered string contains not only digits!")
        quit()
    else:
        str_with_patterns.append(pattern[int(c)])
print()

for row in range(5):
    for col in range(len(user_input)):
        print(str_with_patterns[col][row],end=' ')
    print()
print("That\'s all!")
