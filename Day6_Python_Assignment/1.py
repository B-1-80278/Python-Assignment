# Write a menu Driven Program To Calculate the Perimeter and Area of
# different Shapes(Circle,Square,Rectangle) using functions

PI = 3.14
def circle():
    r = int(input("Enter radius of circle: "))
    area = PI * r * r
    perimeter = 2 * PI * r
    print(f"Area of circle is {area} and perimeter is {perimeter}")

def square():
    a = int(input("Enter side of square: "))
    area = a * a
    perimeter = 4 * a
    print(f"Area of square is {area} and perimeter is {perimeter}")

def rectangle():
    a = int(input("Enter length of rectangle: "))
    b = int(input("Enter breadth of rectangle: "))
    area = a * b
    perimeter = 2 * (a + b)
    print(f"Area of rectangle is {area} and perimeter is {perimeter}")

def menu():
    print("-" * 80)
    print("Welcome, what do you want to calculate?")
    print("1. Area & Perimeter of Circle")
    print("2. Area & Perimeter of Square")
    print("3. Area & Perimeter of Rectangle")
    print("4. Exit")
    print("-" * 80)

    choice = int(input("Enter your choice: "))
    return  choice

while True:
    option = menu()

    if option == 1:
        circle()
    elif option == 2:
        square()
    elif option == 3:
        rectangle()
    else:
        print("Exiting")
        break


