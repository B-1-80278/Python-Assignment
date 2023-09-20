# Write a program to print n terms of a Fibonacci series. How can you do the same using
# recursion?

num = int(input("Enter the length of numbers for which Fibonacci series needs to be produced: "))

# first two terms
n1 = 0
n2 = 1
count = 0

# check if the number of terms is valid
if num <= 0:
    print("Please enter a positive integer")
# if there is only one term, return n1
elif num == 1:
    print(f"Fibonacci sequence up to {num}: {n1}")

# generate fibonacci sequence
else:
   print("Fibonacci sequence:")
   while count < num:
       print(n1)
       nth = n1 + n2
       # update values
       n1 = n2
       n2 = nth
       count += 1
