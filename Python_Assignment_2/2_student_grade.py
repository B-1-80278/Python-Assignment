# (2) The marks obtained by a student in 3 different subjects are input by the user. Your
# program should calculate the average of subjects and display the grade.

marks1 = int(input("Enter first subject marks out of 100: "))
marks2 = int(input("Enter second subject marks out of 100: "))
marks3 = int(input("Enter third subject marks out of 100: "))

average = (marks1 + marks2 + marks3) / 3
print("Average marks are ", average)
if average < 59:
    print("And Grade is F")
elif average < 70:
    print("And Grade is D")
elif average < 80:
    print("And Grade is C")
elif average < 90:
    print("And Grade is B")
else:
    print("And Grade is A")
