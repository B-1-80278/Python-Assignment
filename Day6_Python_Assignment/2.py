# Display following menu and write required function for it
# A. Display characters from even position
# B. Display characters from odd position
# C. Display length of a string
# D. Add a at the end of string length times



def display_even_characters():
    str1 = input("Enter any sentence: ")
    str2 = ""
    for i in range(1, len(str1), 2):
        str2 += str1[i]
    print(f"Characters at even positions are {str2}")


def display_odd_characters():
    str1 = input("Enter any sentence: ")
    str_odd = ""
    for i in range(0, len(str1), 2):
        str_odd += str1[i]
    print(f"Characters at odd positions are {str_odd}")

def length_of_string():
    str1 = input("Enter any sentence: ")
    print(f"Length of string is {len(str1)}")
def add_a_to_string():
    str1 = input("Enter any sentence: ")
    new_str = str1 + "a" * len(str1)
    print(new_str)

def menu():
    print("-" * 80)
    print("Welcome, what would you like to do with string?")
    print("1. Display characters from even position")
    print("2. Display characters from odd position")
    print("3. Display length of a string")
    print("4. Add 'a' letter at the end of string equal to length times")
    print("5. Exit")

    choice = int(input("Enter your choice: "))
    return choice

while True:

    option = menu()

    if option == 1:
        display_even_characters()
    elif option == 2:
        display_odd_characters()
    elif option == 3:
        length_of_string()
    elif option == 4:
        add_a_to_string()
    else:
        print("Exiting")
        break



