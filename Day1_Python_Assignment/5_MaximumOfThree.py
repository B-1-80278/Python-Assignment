# Write a Python function to find the maximum of three numbers.

a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
c = int(input("Enter third number: "))

if a > b and a > c:
    print(f"{a} is maximum number among three...")
if b > a and b > c:
    print(f"{b} is maximum number among three...")
if c > a and c > a:
    print(f"{c} is maximum number among three...")

