# Find number of occurrences of each character in the string (irrespective of its case).

string = "abcd efgh ijkl mnop abcd kpg"
list1 = []

for ch in string.lower():
    if ch.isalpha():
        list1.append(ch)
print(list1)

dict1 = dict()
for i in list1:
    if dict1.get(i) is None:
        dict1[i] = 1
    else:
        dict1[i] +=1

print(dict1)
