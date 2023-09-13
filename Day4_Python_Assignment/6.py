# Define a procedure histogram() that takes a list of integers and prints a
# histogram to the screen.
# For example, histogram([4, 9, 7]) should print the following:
# ****
# *********
# *******

numbers = []

for i in range(3):
    num = int(input(f"Enter number {i+1}: "))
    numbers.append(num)
print(numbers)

for element in numbers:
    for i in range(element):
        print("*",end="")
    print()
