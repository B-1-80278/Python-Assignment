# Write a Python function to calculate the factorial of a number
num = int(input("Enter non negative integer: "))

# negative case
if num < 0:
    print("Cannot calculate factorial for negative number....")

fact = 1
while (num > 1):
    fact = (fact * num)
    num = num - 1

print(f"Factorial of given number is {fact}")
