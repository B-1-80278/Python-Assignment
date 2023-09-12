# Write a Python Program to find the repeated item of a tuple(Take a value
# from user which you want to find)

size_of_tuple = int(input("Enter size of tuple: "))

list1 = []

for i in range(size_of_tuple):
    elements = int(input(f"Enter Element {i + 1}: "))
    list1.append(elements)

tuple1 = tuple(list1)

print(f"Tuple of items given by user is {tuple1}")

for i in range(len(tuple1)):
    element_count = tuple1.count(tuple1[i])
    if element_count > 1:
        print(f"Element {tuple1[i]} is repeated more than once")
