# What is numpy and how it is better than list in python? What are ways of creating 1D, 2D
# and 3D arrays in numpy?

"""NumPy is the fundamental package for scientific computing in Python.
It is a Python library that provides a multidimensional array object

1. A list cannot directly handle a mathematical operations, while array can!!!
2. An array consumes less memory than a list!
3. Using an array is faster than a list


We can create a NumPy ndarray object by using the array() function.
o create an ndarray, we can pass a list, tuple or any array-like object into the array() method,
and it will be converted into an ndarray

Example
import numpy as np
b = np.array([1, 2, 3, 4, 5])
c = np.array([[1, 2, 3], [4, 5, 6]])
d = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])
"""
