calls = int(input("Enter number of telephone calls "))

if calls <= 100:
    print("Bill = 200")
if 100 < calls < 151:
    print(f"Bill = {200 + 0.6*(calls - 100)}")
if 150 < calls < 201:
    print(f"Bill = {200 + 0.6*50 + 0.5*(calls - 150)}")
if calls > 200:
    print(f"Bill = {200 + 0.6*50 + 0.5*50 + 0.4*(calls - 200)}")
