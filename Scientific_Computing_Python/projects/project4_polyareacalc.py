class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def set_width(self, width):
        self.width = width

    def set_height(self, height):
        self.height = height

    def get_area(self):
        return self.width * self.height

    def get_perimeter(self):
        perimeter = 2 * self.width + 2 * self.height
        return perimeter

    def get_diagonal(self):
        return (self.width ** 2 + self.height ** 2) ** 0.5

    def get_picture(self):
        if self.width > 50 or self.height > 50:
            return f"Too big for picture."
        picture = ''
        for i in range(0, self.height):
            for j in range(0, self.width):
                picture += '*'
            picture += '\n'
        return picture

    def get_amount_inside():
        pass

    def __repr__(self): 
        arg_list = [f'{key}={val}' for key, val in vars(self).items()]
        args = ', '.join(arg_list)
        return f'{self.__class__.__name__}({args})'
 

class Square(Rectangle):
    def __init__(self, side):
        self.side = side

    def set_side(self, side):
        self.side = side

r1 = Rectangle(3, 6)
print(r1.get_diagonal())
