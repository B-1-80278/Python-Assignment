# Write a Rectangle class in Python language, allowing you to build a
# rectangle with length and width attributes . Create a Perimeter() method to
# calculate the perimeter of the rectangle and a Area() method to calculate the
# area of the rectangle . Create a method display() that display the length, width,
# perimeter and area of an object created using an instantiation on rectangle class.
# Create a Parallelepiped child class inheriting from the Rectangle class and with
# a height attribute and another Volume() method to calculate the volume of the
# Parallelepiped


class Rectangle:

    def __init__(self, lambi, rundi):
        self.__length = lambi
        self.__breadth = rundi

    def calculate_perimeter(self):
        perimeter = 2*(self.__length + self.__length)
        print(f"Perimeter of rectangle is {perimeter}")

    def calculate_area(self):
        area = self.__length * self.__breadth
        print(f"Area of rectangle is {area}")
    def display_info(self):
        print(f"Length of rectangle is {self.__length}")
        print(f"Breadth of rectangle is {self.__breadth}")
        self.calculate_perimeter()
        self.calculate_area()


r1 = Rectangle(10, 20)
r1.display_info()


