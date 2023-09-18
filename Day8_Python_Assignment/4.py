# Python program to create a list of tuples from given list having number and its cube in
# each tuple
# I/P-[1,2,5,6]
# Output-[(1, 1), (2, 8), (5, 125), (6, 216)]

list1 = [1, 2, 5, 6]
print(list1)


def cube(p1):
    return p1 ** 3


list2 = []
for i in list1:
    a = cube(i)
    list2.append(a)
print(list2)

list_of_tuple = []


def merge(l1, l2):
    for index in range(len(l1)):
        b = (l1[index], l2[index])
        list_of_tuple.append(b)
    print(list_of_tuple)


merge(list1, list2)
