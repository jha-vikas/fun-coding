import numpy as np

def count_prog(arr,i):
    arr[1,1] = i
    return ((arr[0] - arr[1]) == (arr[1] - arr[2])).sum() + ((arr[:,0] - arr[:,1]) == (arr[:,1] - arr[:,2])).sum() + \
                    sum([(arr[0,0] - arr[1,1]) == (arr[1,1] - arr[2,2])]) + sum([(arr[0,2] - arr[1,1]) == (arr[1,1] - arr[2,0])])

def check_mid_value(arr):
    arr = np.array(arr)
    mid_vals = [np.mean([arr[1,0],arr[1,2]]),
                    np.mean([arr[0,1],arr[2,1]]),
                    np.mean([arr[0,0],arr[2,2]]),
                    np.mean([arr[0,2],arr[2,0]])
    ]
    mid_vals = [i for i in mid_vals if int(i)==i]
    mid_vals = set(mid_vals)
    return max([count_prog(arr,i) for i in mid_vals])

def read_input_matrix():
    x = [list(map(lambda i: int(i),input().strip().split())) for _ in range(3)]
    x[1].append(x[1][1])
    x[1][1] = 0
    return x
        

if __name__ == "__main__":
    n = int(input())
    for i in range(n):
        max_val = check_mid_value(read_input_matrix())
        print(f"Case #{i+1}: {max_val}")