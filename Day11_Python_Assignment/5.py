# Write a Python program to sort a list of tuples using Lambda.
# Original list of tuples:
# [('Python', 88), ('ML', 90), ('R programming', 97), ('DBMS', 82)]
# Sorting the List of Tuples:
# [('DBMS', 82), ('Python', 88), ('ML', 90), ('R programming', 97)]

list1 = [('Python', 88), ('ML', 90), ('R programming', 97), ('DBMS', 82)]

for tup in list1:
    list1.sort(key= lambda )
    # list2 = list1.sort(key = lambda tup: tup[1])
list1.sort(key=lambda name: name.split()[1])
print(list1)

