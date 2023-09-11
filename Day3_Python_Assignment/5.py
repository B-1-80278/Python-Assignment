#Define a function overlapping() that takes two lists and returns True if they
#have at least one member in common, False otherwise.

list1 = ['a', 'e', 'i', 'o', 'u']
list2 = ['b', 'c', 'd', 'e']

def overlapping():
    for element in list1:
        for value in list2:
            if element == value:
                return True
    return False


if overlapping():
    print("Common word is present")
else:
    print("No common word is present")
