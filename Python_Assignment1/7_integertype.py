#Write a Python program to find given number is positive ,negative or zero.

a = int(input("Enter any integer: "))
if a > 0:
    print(f"{a} is positive ")
if a == 0:
    print("number is zero ")
if a < 0:
    print(f"{a} is negative ")