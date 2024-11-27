f=@(x) 2*sin(x)-x;
g=@(x) 2*cos(x)-1;
a=nan;
b=nan;
n=10000;
h=0.1;
for i=0:h:n
    if((f(i)*f(i+h))<0)
        a=i;
        b=i+h;
        break;
    end
end
if(isnan(a) || isnan(b))
    error("interval not found between [0,100000]");
else
    fprinf("the solution is found to be in the interval of [%.3f,%.3f]\n",a,b);
end
j=0;
tol=0.00001;
x0=(a+b)/2;
while(j<=100000)
    if(g(x0)==0)
        error("Derivative is zero at x = %f. Newton-Raphson method fails.", x0);
    end
    x1=x0-f(x0)/g(x0);
    if(abs(x1-x0)<tol || (abs(x1-x0)/abs(x0))<tol)
        fprintf("solution is converged at %d iterations",j+1);
        fprintf("the solution is %f",x1);
        break;
    end
    j=j+1;
    x0=x1;
end
if(j>10000)
    error("Not converged till 10000 iterations.");
end