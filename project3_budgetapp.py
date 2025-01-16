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
        str_deposit = '\n'
        if action == 'deposit':
            str_deposit += 'initial deposit'
        
        
        return str_deposit


    

def create_spend_chart(categories):
    pass

food = Category('Food')
#.deposit(1000, 'deposit')
print(food)