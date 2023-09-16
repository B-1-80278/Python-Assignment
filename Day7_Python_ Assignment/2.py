# Write a Pandas program to add, subtract, multiple and divide two Pandas Series.
# Sample Series: [2, 4, 6, 8, 10], [1, 3, 5, 7, 9]
import pandas as pd

a = pd.Series([2, 4, 6, 8, 10])
b = pd.Series([1, 3, 5, 7, 9])

print(f"Addition of two panda series is\n{a + b}\n")
print(f"Substract of two panda series is\n{a - b}\n")
print(f"Multiplication of two panda series is\n{a * b}\n")
print(f"Division of two panda series is\n{a / b}\n")

