# Write a Python program to count the number of characters (character frequency) in a string.
# Input:-
# Sample String : sunbeaminfo.com'
# Output:-
# {'s': 1, 'u': 1, 'n': 2, 'b': 1, 'e': 1, 'a': 1, 'm': 2, 'i': 1, 'f': 1, 'o': 2, '.': 1, 'c': 1}

string1 = "sunbeaminfo.com"
frequency_dict = {}

for ch in string1:
    frequency_dict[ch] = None    #adding only keys to dictionry first

for ch in string1:
    if frequency_dict.get(ch) is None:
        frequency_dict[ch] = 1
    else:
        frequency_dict[ch] += 1

print(frequency_dict)
# for ch in string1:


