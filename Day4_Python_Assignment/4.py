# Write a method in python to display the elements of list thrice if it is a
# number and display the element terminated with ‘#’ if it is not a number.
# Hint-: Use InBuilt Function isdigit()
# Refer below as a input:-
# mylist = [’41’,’DROND’,’Sunbeam’, ’13’,’ZARA’]

mylist = [41, 'DROND', 'Sunbeam', 13,'ZARA']
for element in mylist:
    if element in range(0, 50, 1):
        print(f"{element}, {element}, {element}")
    else:
        print(f"{element}#")

