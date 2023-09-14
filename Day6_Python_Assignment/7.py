# Write a NumPy program to create an array with the values 1, 7, 13, 105 and
# determine the size of the memory occupied by the array.

import numpy as np

num_array = np.array([1, 7, 13, 105])
occupied_size= num_array.nbytes

print(f"memory occupied by the array is {occupied_size} bytes")

