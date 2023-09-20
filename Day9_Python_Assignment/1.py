# Write a Python program to create a Vehicle class with max_speed and
# mileage instance attributes. Write a python program to Create a child class Bus
# that will inherit all of the variables and methods of the Vehicle class

class Vehicle:

    def __init__(self, max_speed, mileage):
        self.__max_speed = max_speed
        self.__mileage = mileage

    def print_vehicle_info(self):

        print(f"Maximum speed is {self.__max_speed}")
        print(f"Mileage is {self.__mileage}")



#inheritating from vehicle class
class Bus(Vehicle):
    pass

print("---BUS INFO---")
b1 = Bus("100", "15")
b1.print_vehicle_info()

print("---VEHICLE INFO---")
v1 = Vehicle("120", "10")
v1.print_vehicle_info()
