class Category:

    def __init__(self, name):
        self.name = name
        self.balance = 0
        self.ledger = []
        self.used_defs = {}

    def check_funds(self, amount):
        if self.balance > amount:
            return True
        return False
    
    def deposit(self, amount, description = ""):
        amount = f"{amount:.2f}"
        self.ledger.append({'amount': float(amount), 'description': description})
        self.balance += float(amount)
        first_deposit = 0
        str_deposit = ''
        if description == 'deposit' and first_deposit == 0:
            str_deposit += 'initial deposit'
            first_deposit += 1
        else:
            str_deposit += description
        
        spaces = 30 - len(str_deposit) - len(amount)
        
        str_deposit += ' ' * spaces + amount
        
        self.used_defs[description] = str_deposit
        return str_deposit
    
    def withdraw(self, amount, description = ""):
        if self.check_funds(amount):
            self.balance -= amount
            amount = f"{amount:.2f}"
            self.ledger.append({'amount': float("-" + f"{amount}"), 'description': description})
            if len(description) > 29 - len(amount):
                description = description[:28 - len(amount)]
            str_withdraw = description
            spaces = 29 - len(str_withdraw) - len(amount)
            str_withdraw += ' ' * spaces + "-" + amount
            self.used_defs[description] = str_withdraw
            return True
        return False

    def get_balance(self):
        return self.balance
    
    def transfer(self, amount, category):
        if self.check_funds(amount):
            self.withdraw(amount, f"Transfer to {category.name}")
            category.deposit(amount, f"Transfer from {self.name}")
            return True
        return False

    def __str__(self): 
        num = int((30 - len(self.name)))
        if num % 2 != 0:
            num = num // 2
            category_name = '*' * num + str(self.name) + '*' * (num + 1)
        else:
            num = num // 2 
            category_name = '*' * num + str(self.name) + '*' * num
        category_name += "\n" + "\n".join(self.used_defs.values()) + "\nTotal: " + str(self.get_balance())
    
        return category_name 

    

def create_spend_chart(categories):
    str_chart = 'Percentage spent by category' + '\n'


food = Category('Food')
food.deposit(1000, 'deposit')
food.withdraw(10.15, 'groceries')
food.withdraw(15.89, 'restaurant and more food for dessert')
clothing = Category('Clothing')
food.transfer(50, clothing)
print(food) 