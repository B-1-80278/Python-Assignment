import math


class Computation:
    def __init__(self):
        pass

    def fact(self,num):
        if num<=1 :
            return 1
        return num*self.fact(num-1)

    def Factorial(self,num):
        print(f"factorial of the {num} is {self.fact(num)}")

    def Sum(self, num):
        print(f"sum of first {num} numbers is  {num*(num+1)/2} ")

    def testPrim(self,num):
        for number in range(2,num):
            if num % number ==0:
                print(f"{num} is a NOT PRIME")
                break
        else:
            print(f"{num}is a PRIME NUMBER")


    def testPrims(self,num1,num2):
        for number in range(num1,num2+1):
            self.testPrim(number)
        # mini = min(num1,num2)
        # for number in range(2, mini):
        #     if num1 % number ==0 and num2 % number == 0:
        #         print("ITS NOT PRIME BETWEEN THEM")
        #         break
        # else:
        #     print(f"Numbers {num1} and {num2} ara CO-PRIME")


    def tableMult(self,num):
        print('-' * 45)
        print(f"Multiplication tablr of {num}")
        for number in range(1,11):
            print(f"{number} * {num} = {number*num}")

        print('-' * 45)

    def allTableMulti(self):
        for number in range(1,10):
            self.tableMult(number)


c1 = Computation()
c1.Factorial(4)
c1.Sum(10)
c1.testPrim(21)
c1.testPrim(11)
c1.testPrims(5,7)
c1.tableMult(11)
c1.allTableMulti()