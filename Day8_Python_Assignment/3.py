# Write the Python program to create Bank account class with both a deposit() and a
# withdraw() function.
# In function deposit and withdraw , amount is taken as input(in float) and is then
# added/subtracted from the balance.
# You need to check condition inside withdraw funtion to check whether there is a sufficient
# amount of money available in the account to process a fund withdrawal.

class BankAccount:

    pass

    def __init__(self, balance, amount):
        self.balance= balance
        self.amount = amount

    def deposit(self):

        new_balance = self.balance + self.amount
        print(f"Updated balance is {new_balance}")

    def withdraw(self):
        new_balance = self.balance - self.amount
        print(f"Updated balance is {new_balance}")




print("Welcome to Sunbeam United Bank")
balance1 = int(input("Enter the initial amount you want to open account with: "))
print("Please opt the service")

def menu():
    print("1. Deposit Money")
    print("2. Withdraw money")
    print("3. Exit ")

    choice = int(input("Enter your choice: "))
    return choice

while True:
    option = menu()
    if option == 1:
        amount1 = int(input("Enter the amount you want to deposit: "))
        customer = BankAccount(balance1, amount1)
        customer.deposit()
    elif option == 2:
        amount2 = int(input("Enter the amount you want to withdraw: "))
        customer = BankAccount(balance1, amount2)
        customer.withdraw()
    else:
        print("Exiting Menu")
    break

