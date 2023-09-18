# Create a class named Mobile with attributes ModelName,Company,Price and with
# methods:
# set_attributes, print_details and can_afford

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

    def can_afford(self):
        if self.price < 25000:
            print(f"can afford {self.model_name}")


m1= Mobile("Nord 2", "OnePLus", 18999)
m1.print_details()
m1.can_afford()
