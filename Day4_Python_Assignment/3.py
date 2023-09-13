# Write a Python program to count the elements in a list until
# an element is a tuple.
# Sample input : list = [10, 20, 30, (40,50), 60]
# Sample output = 3

list1 = [10, 20, 30, (40,50), 60]

for element in list1:
    if type(element) is tuple:
       print(f"There are {list1.index(element)} elements until tuple occurs in the list")


