class Category:

    def __init__(self, name):
        self.name = name
        self.balance = 0
        self.ledger = []
        self.used_defs = {}

    def check_funds(self, amount):
        return self.balance > amount
    
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
    total_balance = 0
    num_categories = 0
    for category in categories:
        total_balance += category.balance
        num_categories += 1
    
    num_percentage = 100
    
    while num_percentage >= 0:
        if num_percentage < 100 and num_percentage > 0:
            str_chart += ' '
        elif num_percentage == 0:
            str_chart += '  '
        
        str_chart += str(num_percentage) + "|"
        for category in categories:
            if num_percentage <= round((100 * category.balance)/ total_balance, -1):
                str_chart += ' o '
            else:
                str_chart += '   '
        str_chart += '\n'
        num_percentage -= 10
    
    str_chart += 4 * ' ' + (num_categories * 3) * '-' + '-'

        


    
    return str_chart

food = Category('Food')
food.deposit(1000, 'deposit')
food.withdraw(10.15, 'groceries')
food.withdraw(15.89, 'restaurant and more food for dessert')
clothing = Category('Clothing')
food.transfer(50, clothing)
print(create_spend_chart([food, clothing])) 