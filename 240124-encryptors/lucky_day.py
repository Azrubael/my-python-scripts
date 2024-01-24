birth = input("Enter your birdh date in 8-digits format [YYYY-MM-DD]: ")
res = ''
for d in birth:
    if d.isdigit():
        res += d

if len(res) != 8 or int(res[4:6]) > 12 or int(res[6:]) > 31:
    print("Wrong input!")
    quit()

length = 8
while length != 1:
    res = str(sum([int(d) for d in res]))
    length = len(res)

print(res)
