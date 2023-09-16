# Write a Pandas program to change the order of index of a given series.
import pandas as pd

a = pd.Series([1, 2, 3, 4, 5], index= ['A', 'B', 'C', 'D', 'E'])
print(a)

b = pd.Series(a, index = ['E', 'A', 'D', 'B', 'C'])
print("Data Series after changing the order of index:\n", b)