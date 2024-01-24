text1 = input("Enter the first anagram's string: ")
text2 = input("Enter the second anagram's string: ")

txt1 = text1.lower().strip()
txt2 = text2.lower().strip()

dic1 = dict()
dic2 = dict()

for char in txt1:
    dic1[char] = dic1.get(char, 0) + 1

for char in txt2:
    dic2[char] = dic2.get(char, 0) + 1

if len(dic1) > 0 and dic1 == dic2:
    print("Anagrams")
else:
    print("Not anagrams")
