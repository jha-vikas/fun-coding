# https://www.hackerrank.com/challenges/saveprincess/problem

#!/usr/bin/python

def displayPathtoPrincess(n,grid):
    #print all the moves here
    if grid[0][0] == 'p':
        print("UP\nLEFT\n"*(n//2))
    elif grid[0][n-1] == 'p':
        print("UP\nRIGHT\n"*(n//2))
    elif grid[n-1][0] == 'p':
        print("DOWN\nLEFT\n"*(n//2))
    elif grid[n-1][n-1] == 'p':
        print("DOWN\nRIGHT\n"*(n//2))


        
m = int(input())
grid = [] 
for i in range(0, m): 
    grid.append(input().strip())

displayPathtoPrincess(m,grid)