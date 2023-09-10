# get age input from user and check if user is eligible for voting

age = int(input("Enter the age of person: "))

if age < 18:
    print("Not eligible for voting")
else:
    print("Eligible for voting")
