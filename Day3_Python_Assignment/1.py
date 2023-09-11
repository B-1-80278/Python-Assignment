# Using for loop, write and run a Python program to find factorial from 0 to 10.


def factorial_calculation(num):
    fact = 1
    while num > 1:
        fact = fact * num
        num -= 1
    return fact


for num in range(11):
    print(f"factorial of {num} is {factorial_calculation(num)}")