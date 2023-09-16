# Write a Python program to replace dictionary values(V,VI) and with their average.
# Input:-

student_details= [
    {'id' : 1, 'subject' : 'math', 'V' : 70, 'VI' : 82},
    {'id' : 2, 'subject' : 'math', 'V' : 73, 'VI' : 74},
    {'id' : 3, 'subject' : 'math', 'V' : 75, 'VI' : 86}
]
new_student_details = []
for dict1 in student_details:
    a = (dict1.get('V') + dict1.get('VI')) / 2
    dict1.pop('V')
    dict1.pop('VI')
    dict1['V+VI'] = a
    new_student_details.append(dict1)
print(new_student_details)

