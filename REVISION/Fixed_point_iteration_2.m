f=@(x) tan(x)-4*x;
g=@(x) tan(x)/4;
tol=0.001;
x0=1;
clc;
j=0;
while(j<=10000)
    x1=g(x0);
    if(abs(x1-x0)<tol ||(abs(x1-x0)/abs(x1))<tol)
        fprintf("converged at %d iterations\n",j+1);
        fprintf("The solution is found to be %f\n",x1);
        break;
    end
    x0=x1;
    j=j+1;
end
if(j>10000)
    error("not converged till 10000 iterations");
end