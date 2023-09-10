# Write a Python Program to Convert Celsius To Fahrenheit vice versa.
# fahrenheit = (celsius * 1.8) + 32

tempC = int(input("Enter temprature in celcius "))
F = (tempC*1.8) +32
print(f"Temperature in Fahrenheit {F}")

tempF = int(input("Enter temperature in Fahrenheit "))
C = (tempF - 32)/1.8
print(f"Temperature in Celsius is {C}")

