# Q6. Write a function in Python to count and display the total number of words
# in a text file.

with open("text.txt") as new_file:
    data = new_file.read()
    words = data.split()     #The split() method splits a string into a list of individuL words.
    
print('Number of words in text file :', len(words))
