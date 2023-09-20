# Create a python application for the following requirement . It is a banking
# application having minimum 5 accounts in it. Class bank has following
# details bankName, branch name,IFSC code , accountList(5 accounts) Class
# Account has following details AccHolderName ,mobileNumber ,
# accNumber, balance Minimum balance amount of Rs3000 must be there in
# account .
# Implement following functions::
# 1:accept bank information
# 2:print bank information
# 3:add new account
# 4.print information of all accounts
# 5.print information of selected accounts
# 6.delete selected account (Return 1 if deleted else 0)
# 7.Deposit amount in a account (Return updated balance)
# Write a menu driven program to achieve above requirements.

class Account:

    def __init__(self, name, mobile_number, account_number):
        self.__name = name
        self.__mobile_number = mobile_number
        self.__account_number = account_number

    def print_customer_details(self):
        print(f"Name = {self.__name}")
        print(f"Mobile Number = {self.__mobile_number}")
        print(f"Account Number = {self.__account_number}")

    def get_name(self):
        return self.__name

    def get_mobile(self):
        return self.__mobile_number

    def get_account_number(self):
        return self.__account_number

    def set_name(self, name):
        self.__name = name

    def set_mobile(self, mobile_number):
        self.__mobile_number = mobile_number

    def set_account_number(self, account_number):
        self.__account_number = account_number


class Bank:

    def __init__(self, bank_name, branch, ifsc_code):
        self.__bank_name = bank_name
        self.__branch = branch
        self.__ifsc = ifsc_code
        self.__customers = []

    def new_customer(self, name, mobile_number, account_number):
        customer = Account(name, mobile_number, account_number)
        self.__customers.append(customer)



    def print_bank_info(self):
        print(f"Bank name = {self.__bank_name}")
        print(f"Branch = {self.__branch}")
        print(f"IFSC Code = {self.__ifsc}")
        print()
    def customer_customer_info(self):
        print("Customer List")
        print("-" * 50)
        print(f"|{'Name':<10}|{'Mobile Number':<15}|{'Account Number':<15}|")
        print("-" * 50)

        for customer in self.__customers:
            print(f"|{customer.get_name():<10}|{customer.get_mobile():<15}|{customer.get_account_number():<15}|")

b1 = Bank('SBI', 'Market Yard', 'SBIN006117' )
b1.new_customer("Subham", 97668757324, 1212212)
b1.new_customer("Sumit", 9238298392, 1111111)
b1.new_customer("Vasant", 8791741984, 8798978)


def menu():
    print("Welcome to State Bank of India")
    print("Which operations would you like to perform")

    print("1. Accept bank information")
    print("2. Print bank information")
    print("3. Add new account")
    print("4. print information of all accounts")
    print("5. print information of selected accounts")
    print("6. delete selected account (Return 1 if deleted else 0)")
    print("7 .Deposit amount in a account (Return updated balance)")
    print("8. Exiting")
    choice = int(input("Enter your choice: "))
    return choice

while True:
    option = menu()
    if option == 2:
        b1.print_bank_info()
    elif option == 4:
        b1.customer_customer_info()

