# Write a code to check if given string is palindrome or not.

string = "Was it a rat I saw?"
all_lower = string.lower()
print(all_lower)
new_string = []

for ch in all_lower:
    if ch.isalpha():
        new_string.append(ch)

reversed_string = new_string[::-1]


if new_string == reversed_string:
    print("Given string is palindrome")
else:
    print("Given string is not palindrome")

