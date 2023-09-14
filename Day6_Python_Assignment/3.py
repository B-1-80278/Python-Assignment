# Write a program that reads a string from keyboard and display:
# * The number of uppercase letters in the string
# * The number of lowercase letters in the string
# * The number of digits in the string
# * The number of whitespace characters in the string

str1 = input("Enter any sentence: ")

def count_uppercase():

    count = 0
    for i in str1:
        if i.isupper():
            count += 1
    print(f"Number of upper case letter are {count}")

count_uppercase()


def count_lowercase():
    count = 0
    for i in str1:
        if i.islower():
            count += 1
    print(f"Number of lower case letters are {count}")

count_lowercase()


def count_digits():
    count = 0
    for i in str1:
        if i.isdigit():
            count += 1
    print(f"Number of digits are {count}")

count_digits()


def count_whitespace():
    count = 0
    for i in str1:
        if i == " ":
            count += 1
    print(f"Number of whitespaces are {count}")

count_whitespace()

