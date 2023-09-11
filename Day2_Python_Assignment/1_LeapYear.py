#determine whether the year is a leap year or not.

year = int(input("Enter year: "))

if year % 400 == 0 or year % 4 == 0 and year % 100 != 0:
    print("Given year is leap year......")
else:
    print ("Given year is not leap year...")


