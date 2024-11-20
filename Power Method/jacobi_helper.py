x=[0,0,0,0]
def help(x):
    return [1/10*(6+x[1]-2*x[2]),1/11*(25+x[0]+x[2]-3*x[-1]),1/10*(-11-2*x[0]+x[1]+4*x[-1]),1/8*(15-3*x[1]+x[2])]
c=0; 
flag=True
while(flag):
    temp=x
    x=help(x)
    print(f"in the  iterration :: {c}\n x={x}")
    c+=1
    for i in range(len(x)):
        if(abs(temp[i]-x[i])<=0.0001):
            flag=False