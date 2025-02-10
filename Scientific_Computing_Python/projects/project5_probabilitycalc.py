import copy
import random

class Hat:
    def __init__(self, **kwargs):
        self.kwargs = kwargs
        if len(self.kwargs) == 0:
            raise AttributeError(
                f"Cannot create '{cls.__name__}' class: there are no balls in the hat!!!"
            )
        self.contents = []
        for key, value in self.kwargs.items():
            for i in range(0, value):
                self.contents.append(key)

    def draw(self, num):
        res = []
        if len(self.contents) < num:
            aux = self.contents
            self.contents = []
            return aux

        for i in range(num):
            value = random.choice(self.contents)
            res.append(value)
            self.kwargs[value] -= 1
            self.contents.remove(value)
        return res

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    count = 0
    
    for i in range(num_experiments):
        hat_two = copy.deepcopy(hat)
        expected = copy.deepcopy(expected_balls)
        drawn = hat_two.draw(num_balls_drawn)

        for color in drawn:
            if color in expected:
                if expected[color] > 0:
                    expected[color] -= 1

        
        if all([value == 0 for value in expected.values()]):
            count += 1
            
    return count / num_experiments

hat = Hat(black=6, red=4, green=3)
probability = experiment(hat=hat,
                  expected_balls={'red':2,'green':1},
                  num_balls_drawn=5,
                  num_experiments=2000)
print(probability)     


