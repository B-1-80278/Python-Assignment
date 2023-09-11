# Find and display the largest number of a list without using built-in function max().
# Your program should ask the user to input values in list from keyboard.

size = int(input("Enter size of list: "))

list1 = []

for i in range(size):
    element = int(input(f"Enter element {i + 1}: "))
    list1.append(element)

largest = list1[0]
for i in range(size):
    if list1[i] > largest:
        largest = list1[i]

print(f"User given list is {list1}")
print(f"Largest number in the list is {largest}")
