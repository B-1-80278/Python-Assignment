num = int(input("Enter 4 digit number ")) #6532
e = num//10 #653
f = e//10   #65
a = f//10   #6

b = f % a #5
c = e % f #3
d = num % e #2

print(f"face values are {a},{b},{c},{d}")

print(f"reversed number is {d},{c},{b},{a}")

print("Place values are ")
print(d, c*10, b*100, a*1000)







