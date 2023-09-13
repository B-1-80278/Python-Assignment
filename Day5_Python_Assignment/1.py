# Given a dictionary of students and their favourite colours:
# people={'Arham':'Blue','Lisa':'Yellow',''Vinod:'Purple','Jenny':'Pink'}
# A. Find out how many students are in the list
# B. Change Lisa’s favourite colour
# C. Remove 'Jenny' and her favourite colour
# D. Sort and print students and their favourite colours alphabetically by name

people = {
    'Arham': 'Blue',
    'Lisa': 'Yellow',
    'Vinod': 'Purple',
    'Jenny': 'Pink'
}

# A. Find out how many students are in the list
students = people.keys()
color = people.values()
print(f"A. Number of students in the list are {len(students)}")

# B. Change Lisa’s favourite colour
people['Lisa'] = "Red"
print(f"B. Changing Lisa's favourite color to {people['Lisa']}")

# C. Sort and print students and their favourite colours alphabetically by name
sorted_list = sorted(people.items())
print(f"C. Alphabetically sorted dictionary  is {sorted_list}")


# D. Remove 'Jenny' and her favourite colour
people.pop('Jenny')
print(f"D. Dictionary after removing Jenny: {people}")


