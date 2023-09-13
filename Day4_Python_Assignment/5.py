# Write a function find_longest_word() that takes a list of words and returns
# the length of the longest one.

list_of_words = []
count = []
for i in range(5):
    word = input(f"Enter word {i + 1}: ")
    count1 = len(word)
    list_of_words.append(word)
    count.append(count1)

print(f"user given list of words is {list_of_words}")
print(f"lengthiest word is {(max(count))}")




