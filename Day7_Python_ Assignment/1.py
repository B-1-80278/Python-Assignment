# Write a version of a palindrome recognizer that also accepts phrase
# palindromes such as "Go hanga salami I'm a lasagna hog.", "Was it a rat I
# saw?", "Step on no pets", "Sit on a potato pan, Otis", "Lisa Bonet ate no
# basil", "Satan, oscillate my metallic sonatas", "I roamed under it as a
# tired nude Maori","Rise to vote sir", or the exclamation "Dammit, I'm mad!".
# Note that punctuation, capitalization, and spacing are usually ignored.

sentence = "Go hanga salami I'm a lasagna hog."
all_lower = sentence.lower()
new_sentence = []

for ch in all_lower:
    if ch.isalpha():
        new_sentence.append(ch)

new_reversed_sentence = new_sentence[::-1]

if new_sentence == new_reversed_sentence:
    print("Given phrase is palindrome...")
else:
    print("Given phrase is not palindrome...")

