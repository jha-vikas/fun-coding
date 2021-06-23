# https://www.hackerrank.com/challenges/botclean?hr_b=1

#!/usr/bin/python

# Head ends here

def calculate_dist(posr, posc, pos_d):
    #pos_d is the tuple/list with row and cell
    #of the target cell
    delta = [x-y for x,y in zip(pos_d, [posr,posc])]
    #dist = sum(map(abs, delta))
    return delta

def move(delta):
    #delta is 
    if delta[0] > 0:
        return "DOWN"
    elif delta[0] < 0:
        return "UP"
    elif delta[1] > 0:
        return "RIGHT"
    elif delta[1] < 0:
        return "LEFT"
    else:
        return "CLEAN"

def next_move(posr, posc, board):
    dirt = []
    n = len(board)
    for i in range(n):
        for j in range(n):
            if board[i][j] == "d":
                dirt.append([i,j])
    
    deltas = [calculate_dist(posr, posc, pos_d) for pos_d in dirt]
    dists  = [sum(map(abs, delta)) for delta in deltas]
    index_min = dists.index(min(dists))
    delta_to_use = deltas[index_min]
    exe_move = move(delta_to_use)  
    
    print(exe_move)

# Tail starts here

if __name__ == "__main__":
    pos = [int(i) for i in input().strip().split()]
    board = [[j for j in input().strip()] for i in range(5)]
    next_move(pos[0], pos[1], board)