# # Write a program to sum all the values of a dictionary.
# # Hint dict1 = {‘key 1’: 200, ‘key 2’: 300}
# # Expected output
# # Result: 500
#
dict1 = {
    "key_1": 200,
    'key_2': 300
}

print(dict1.values())
sum = dict1["key_1"] + dict1["key_2"]
print(f"Sum of dictionary values is {sum}")

