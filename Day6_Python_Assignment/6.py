# Write a program that rotates the element of a list so that the element at the
# first index moves to the second index, the element in the second index moves to
# the third index, etc., and the element in the last index moves to the first index.
# Input:- [‘Sunday’,’Monday’,’Tuesday’,’Wednesday’]
# Output:- [’Wednesday’, ‘Sunday’, ’Monday’, ’Tuesday’]

list1 = ['Sunday', 'Monday', 'Tuesday', 'Wednesday']

element = list1.pop()  #pop up last element in list

list1.insert(0, element)

print(list1)