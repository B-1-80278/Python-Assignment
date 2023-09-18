# Create a class named Mobile with attributes ModelName,Company,Price and with
# methods:
# set_attributes, print_details and can_afford

model_name1 = input("Enter the model name of mobile: ")
price1 = int(input("Enter the price of mobile: "))
company1 = input("Enter the company of mobile: ")
budget1 = int(input("Enter your budget limit for mobile: "))


class Mobile:

    pass

    def __init__(self, model_name="", company="", price=0):
        self.model_name = model_name
        self.company = company
        self.price = price

    def print_details(self):
        print(f"Model Name = {self.model_name}")
        print(f"Company = {self.company}")
        print(f"Price = {self.price}")

    def can_afford(self, budget):
        if self.price < budget:
            print(f"can afford {self.model_name}")


m1 = Mobile(model_name1, company1, price1)
m1.print_details()
m1.can_afford(budget1)
