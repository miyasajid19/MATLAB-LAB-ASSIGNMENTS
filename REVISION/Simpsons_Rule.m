clc;
n=20;
f=@(x) cos(x)^2;
a=-0.25;
b=0.25;
if(mod(n,2)==0)
    sum=0;
    h=(b-a)/n;
    for i=1:n-1
        x=a+h*i;
        if(mod(i,2)==0)
            sum=sum+2*f(x);
        else
            sum=sum+4*f(x);
        end
    end
    sum=sum+f(a)+f(b);
    soln=(h/3)*sum;
    fprintf("the solution is found to be %f",soln);
else
    error("intervals should be even")
end