# Calculate the sum and average of the digits present in a string

str1 = "Python83737@#8496"
sum = 0
for i in str1:
    if i.isdigit():
        sum += int(i)
print(sum)