# Q6. Write a function in Python to count and display the total number of words
# in a text file.

with open("text.txt") as new_file:
    count = 0


    for line in new_file:
        for c in line:
            if c == ' ' or c == '\n':
                count += 1

print("Total number of words:", (count+1))