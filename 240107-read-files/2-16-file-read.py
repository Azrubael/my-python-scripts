with open("my_information.txt",'w',encoding='utf-8') as my_file:
    my_file.write("Name is Tom Hardy.\n")
    my_file.write("I am an English actor and producer.\n")
    my_file.write("I am active in charity work.\n")
with open("my_information.txt",'r',encoding='utf-8') as my_file:
    print(my_file.readline())
    print(my_file.readlines())


with open("my_information.txt",'w',encoding=  'utf-8') as my_file:
    my_file.write("Name is Tom Hardy.\n")
    my_file.write("I am an English actor and a producer.\n")
    my_file.write("I am active in charity work.\n")
with open("my_information.txt",'r',encoding='utf-8') as my_file:
    print(my_file.readline())
    my_file.seek(0, 0)
    print(my_file.readlines())