# change the "NUMBER_OF_DISKS" variable to solve the puzzle you need
NUMBER_OF_DISKS = 5
# the A variable is a list in the range [1, NUMBER_OF_DISKS], but in reverse order
A = list(range(NUMBER_OF_DISKS, 0, -1))
# the variables B and C are empty because thats how this puzzle works
B = []
C = []

# function to solve the puzzle
def move(n, source, auxiliary, target):
    # if NUMBER_OF_DISKS is equal or less than 0, the problem won't be possible to solve, so it breaks
    if n <= 0:
        return
    # move n - 1 disks from source to auxiliary, so they are out of the way
    move(n - 1, source, target, auxiliary)
        
    # move the nth disk from source to target
    target.append(source.pop())
        
    # display our progress
    print(A, B, C, '\n')
        
    # move the n - 1 disks that we left on auxiliary onto target
    move(n - 1,  auxiliary, source, target)
              
# initiate call from source A to target C with auxiliary B
move(NUMBER_OF_DISKS, A, B, C)