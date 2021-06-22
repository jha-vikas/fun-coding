#

def nextMove(n,r,c,grid):
    for i in range(n):
        for j in range(n):
            if grid[i][j] == "p":
                p = (i,j)
    delta = [(x-y) for x,y in zip(p,(r,c))]
    if delta[1] < 0:
        flag = "LEFT"
    elif delta[1] > 0:
        flag = "RIGHT"
    elif delta[0] > 0:
        flag = "DOWN"
    elif delta[0] < 0:
        flag = "UP"
    return flag

n = int(input())
r,c = [int(i) for i in input().strip().split()]
grid = []
for i in range(0, n):
    grid.append(input())

print(nextMove(n,r,c,grid))