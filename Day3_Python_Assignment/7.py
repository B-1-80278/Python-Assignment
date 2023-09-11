# Write a function filter_long_words() that takes a list of words and
# an integer len and returns the list of words that are longer than len.

list1 = ["india", "sri", "goa", "china", "cobra", "sunbeam"]
comparison_length = 3
list_of_words = []


def fiter_long_words():
    for i in range(6):

        if len(list1[i]) > comparison_length:
            list_of_words.append(list1[i])


fiter_long_words()

print(f"Given list is {list1}")
print(f"List of words which has more than 3 alphabets is {list_of_words}")
