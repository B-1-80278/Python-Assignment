# write a function to return compound interest

principal = int(input("Enter the principal: "))
RoI = int(input("Enter the rate of interest: "))
time = int(input("Enter the number of years: "))


def ci(p, r, n):
    return p * ((1 + (r / 100)) ** n) - p


print(f"Compound Interest is {ci(principal, RoI, time)}")
