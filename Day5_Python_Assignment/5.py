# Write a program to read 6 numbers and create a dictionary having keys EVEN and ODD.
# Dictionary's value should be stored in list. Your dictionary should be like:
# {'EVEN':[8,10,64], 'ODD':[1,5,9]}

EVEN1 = list()
ODD1 = list()

for i in range(6):
    n = int(input(f"Enter number {i+1}: "))
    if n % 2 == 0:
        EVEN1.append(n)
    else:
        ODD1.append(n)

dict1 = {
    'EVEN' : EVEN1,
    'ODD' : ODD1
}

print(dict1)
