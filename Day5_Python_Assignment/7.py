# Write a program in Python to read a string from the keyboard. Replace each ‘this’ word
# with ‘that word’ in this String. Example: this is me and this is my python program.
# Output: That is me and That is my python program

string1 = input("Enter a sentence containing 'this' word: ")

this_word = string1.replace('this','that')
this_word = this_word.replace('This','That')

print(f"Output: {this_word}")

