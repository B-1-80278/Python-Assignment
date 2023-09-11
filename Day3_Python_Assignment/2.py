# Write a program that accepts a list from user and print the alternate element of list.

size = int(input("Enter size of list: "))
list1 = []

for i in range(size):
    element = int(input(f"Enter element {i+1}: "))
    list1.append(element)

print(f"User given list is {list1}")

new_list = []
for position in range(0, size, 2):
    new_list.append(list1[position])

print(f"List of alternate element is {new_list}")
