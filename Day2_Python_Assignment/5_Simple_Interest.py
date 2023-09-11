# write a function to return simple interest

principal = int(input("Enter the principal: "))
RoI = int(input("Enter the rate of interest: "))
time = int(input("Enter the number of years: "))

def si(p,r,n):
    return p*r*n/100

print(f"Simple interest is  {si(principal, RoI, time)}")
