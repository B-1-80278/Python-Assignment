# Concatenate two lists in the following order by using list comprehension
# Input:- list1 = ["Hello ", "take "]
# list2 = ["Dear", "Sir"]
# Output:- [’Hello Dear’, ’Hello Sir’, ’take Dear’, ’take Sir’]

list1 = ["Hello ", "take "]
list2 = ["Dear", "Sir"]
output = []
for word1 in list1:
    for word2 in list2:
        new_word = word1 + word2
        output.append(new_word)

print(f"Concatenated Output:- {output}")

