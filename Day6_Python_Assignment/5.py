# Calculate the sum and average of the digits present in a string

str1 = "Python83737@#8496"
sum = 0
count = 0
for i in str1:
    if i.isdigit():
        count += 1
        sum += int(i)
print(count)
avg = sum/count

print(f"The sum of digits present in a string is {sum} and average is {avg:.2f}")
