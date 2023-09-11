# Replace single element ‘b’ in given list [’a’, ’b’, ’c’, ’d’, ’e’] with [1, 2, 3].

list1 = ['a', 'b', 'c', 'd', 'e']

index_of_b = list1.index('b')

#removing 'b' from list
list1.pop(index_of_b)

list2 = [1, 2, 3]

list1.insert(index_of_b, list2)

print(list1)
