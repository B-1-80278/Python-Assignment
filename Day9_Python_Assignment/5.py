# Q5. Write a function in python to count the number of lines from a text file
# "story.txt" which is not starting with an alphabet "C".Example: If the file "test.txt" contains the following lines:
# Connecting DB’s with Python.
# Working with DB’s using Python.
# Accessing and Manipulating DB’s.
# Creation of Python virtual Environment.
# Working with beautiful soup.
# Working with matplotlib, seaborn.
# The function should display the output as 4


with open("text.txt") as new_file:
    count = 0
    line_no =0

    for line in new_file:
        line = line.replace("\n", "")
        if line[0] != 'C':
            count += 1
        line_no +=1
        print("Line", line_no, line)


print("Total lines without starting 'C':", count)