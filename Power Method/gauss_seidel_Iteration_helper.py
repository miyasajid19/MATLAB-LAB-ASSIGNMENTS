import numpy as np
def helper(x):
    x[0]=1/10*(6+x[1]+2*x[2])
    x[1]=1/11*(25+x[0]+x[2]-3*x[3])
    x[2]=1/10*(-11-2*x[0]+x[1]+x[3])
    x[3]=1/8*(15-3*x[1]+
    x[2])
x=[0,0,0,0]
iter=0
flag=True

while(flag):
    temp=x.copy()
    helper(x)
    print(f"in iteration :: {iter}\n {x}" )
    iter+=1
    # input()
    for i in range(len(x)):
        if(abs(temp[i]-x[i])==0.0):
            flag=False
            break;    


# ========================part 2=============================

def helper2(x):
    x[0] = 1 / 4 * (3 - x[1] - x[2])
    x[1] = 1 / 7 * (19 - 2 * x[0] - x[2])
    x[2] = 1 / 12 * (31 - x[0] + 3 * x[1])

# Initial guess
x = [0, 0, 0]
flag = True
iter = 0
tolerance = 0.001

while flag:
    temp = x.copy()
    helper2(x)
    
    # Calculate the relative error (difference in values, not norms)
    relativeError = np.linalg.norm(np.subtract(x, temp)) / np.linalg.norm(x)

    print(f"iteration {iter}::\n{x} with error {relativeError}")
    iter += 1
    if relativeError < tolerance:
        flag = False  # Stop if the error is small enough

