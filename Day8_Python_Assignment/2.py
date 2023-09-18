# Define a Circle class allowing to create a circleC (O, r) with center O(a, b) and radius r
# using the constructor:
# def init (self,a,b,r):
# self.a = a
# self.b = b
# self.r = r
# A:- Define a Area() method of the class which calculates the area of the circle.
# B:-Define a Perimeter() method of the class which allows you to calculate the perimeter of
# the circle.


class Circle:

    pass

    def __init__(self, a=0, b=0, r=0):
        self.a = a
        self.b = b
        self.r = r

    def area_of_circle(self):

        area = (22/7) * self.r * self.r
        print(f"Area of circle is {area}")

    def perimeter_of_circle(self):

        perimeter = 2 * (22/7) * self.r
        print(f"Perimeter of circle is {perimeter}")


c1 = Circle(0, 0, 7)
c1.area_of_circle()
c1.perimeter_of_circle()
