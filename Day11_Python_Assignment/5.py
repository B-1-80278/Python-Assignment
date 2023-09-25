# Write a Python program to sort a list of tuples using Lambda.
# Original list of tuples:
# [('Python', 88), ('ML', 90), ('R programming', 97), ('DBMS', 82)]
# Sorting the List of Tuples:
# [('DBMS', 82), ('Python', 88), ('ML', 90), ('R programming', 97)]

list1 = [('Python', 88), ('ML', 90), ('R programming', 97), ('DBMS', 82)]
list1.sort(key=lambda x: x[1])
print(list1)

