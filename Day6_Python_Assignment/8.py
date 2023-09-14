# Write a NumPy program to convert data type into a floating type.


import numpy as np

numbers = [10, 20, 30, 40, 50]

a2 = np.array(numbers, dtype= 'float')

print(a2.dtype)
