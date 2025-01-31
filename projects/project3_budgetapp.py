class Category:

    def __init__(self, name):
        self.name = name
        self.balance = 0
        self.ledger = []
        self.used_defs = {}
        self.withdrawed = 0

    def check_funds(self, amount):
        return self.balance >= amount
    
    def deposit(self, amount, description = ""):
        amount = f"{amount:.2f}"
        self.ledger.append({'amount': float(amount), 'description': description})
        self.balance += float(amount)
        first_deposit = 0
        str_deposit = description
        
        spaces = 30 - len(str_deposit) - len(amount)
        
        str_deposit += ' ' * spaces + amount
        
        self.used_defs[description] = str_deposit
        return str_deposit
    
    def withdraw(self, amount, description = ""):
        if self.check_funds(amount):
            self.balance -= amount
            self.withdrawed -= amount
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
    total_withdrawed = 0
    num_categories = 0
    longest_name = 0
    for category in categories:
        total_withdrawed += category.withdrawed
        num_categories += 1
        if len(category.name) > longest_name:
            longest_name = len(category.name)
    num_percentage = 100
    
    while num_percentage >= 0:
        if num_percentage < 100 and num_percentage > 0:
            str_chart += ' '
        elif num_percentage == 0:
            str_chart += '  '
        
        str_chart += str(num_percentage) + "|"
        
        for category in categories:
            if num_categories == 1:
                str_chart += ' o '

            elif num_percentage <= (100 * category.withdrawed /  total_withdrawed) // 10 * 10:
                str_chart += ' o '

            else:
                str_chart += '   '
        str_chart += ' ' + '\n'
        num_percentage -= 10
    
    str_chart += 4 * ' ' + (num_categories * 3) * '-' + '-\n' + '    '
    
    for rows in range(0, longest_name):
        for i in range(0, num_categories):
            if len(categories[i].name) > rows:
                str_chart += ' ' + categories[i].name[rows] + ' '
            else:
                str_chart += '   '
            if i == num_categories - 1 and rows != longest_name -1:
                str_chart += ' ' + '\n' + 4 * ' '
    str_chart += ' '
    return str_chart

