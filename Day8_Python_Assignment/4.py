# Python program to create a list of tuples from given list having number and its cube in
# each tuple
# I/P-[1,2,5,6]
# Output-[(1, 1), (2, 8), (5, 125), (6, 216)]

list_of_numbers = [1, 2, 5, 6]

def cube(*args):
        args = args ** 3
        print(args)


for i in list_of_numbers:
    cube(i)

