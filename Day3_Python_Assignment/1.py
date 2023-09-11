# Using for loop, write and run a Python program to find factorial from 0 to 10.


def factorial_calculation(num):
    fact = 1
    while num > 1:
        fact = fact * num
        num -= 1
    return fact

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for num in numbers:
    print(f"factorial of {num} is {factorial_calculation(num)}")
