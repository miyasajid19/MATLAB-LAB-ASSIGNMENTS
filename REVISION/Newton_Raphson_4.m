f=@(t) 9*exp(-t)*sin(2*pi*t)-3.5;
g=@(t) 9*exp(-t)*(-sin(2*pi*t)+2*pi*cos(2*pi*t));
a=nan;
b=nan;
h=0.1;
clc;
% ivt
for i=0:h:1000
    if(f(i)*f(i+h)<0)
        a=i;
        b=i+h;
        break;
    end
end
if(isnan(a)||isnan(b))
    error("interval not found ");
else
    fprintf("solution is found to be in [%.3f,%.3f]",a,b);
end
x0=(a+b)/2;
tol=0.00001;
j=0;
while (j<=10000)
    x1=x0-f(x0)/g(x0);
    if(abs(x1-x0)<tol || (abs(x1-x0)/abs(x1))<tol)
        fprintf("converged at %d iterations\n",j+1);
        fprintf("the solution is found to be %f",x1);
        break;
    end
    j=j+1;
    x0=x1;
end
if(j>10000)
    error("not converged");
end