class Category:

    def __init__(self, name):
        self.name = name
    
    def __str__(self): 
        num = int((30 - len(self.name)))
        if num % 2 != 0:
            num = num // 2
            return '*' * num + str(self.name) + '*' * (num+ 1)
        else:
            num = num // 2 
        return '*' * num + str(self.name) + '*' * num
    
    def deposit(self, amount, action):
        self.amount = amount
        self.action = action
        first_deposit = 0
        str_deposit = '\n'
        if action == 'deposit' and first_deposit == 0:
            str_deposit += 'initial deposit'
            first_deposit += 1
        else:
            str_deposit += action
        
        return str_deposit
    
    def withdraw(self, amount, action):
        self.amount = amount
        self.action = action
        pass

    def get_balance(self):
        pass
    
    def transfer(self, amount, category):
        pass

    def check_funds(self):


    
def create_spend_chart(categories):
    str_chart = 'Percentage spent by category' + '\n'


food = Category('Food')
food.deposit(1000, 'deposit')
print(food)