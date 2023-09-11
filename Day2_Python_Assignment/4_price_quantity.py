# Write a program that will calculate the price for a quantity entered from the
# keyboard, given that the unit price is Rs 5 and there is a discount of 10 percent
# for quantities over 30 and a 15 percent discount for quantities over 50.

quantity = int(input("Enter Quantity: "))

if quantity < 31:
    print("Total price is ", 5 * quantity)
elif 30 < quantity < 51:
    print("Total price is ", (150 + 4.5 * (quantity-30)))
else:
    print("Total price is ", (240 + 4.25 * (quantity - 50)))
