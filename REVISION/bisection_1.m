clc
N=input('enter the no of iterations you want to perform');
h=input('enter the value of step size');
f=@(x) x^2-29;
for i  = -N:h:N 
    if(f(i)*f(i+h)<0)
        a=i;
        b=i+h;
    end

end
fprintf("the interval where root lies is [%.3f,%.3f]\n",a,b);
% implementing bisection method
tol=input("enter the tolerating  value ");
while(abs(a-b)>tol)
    c=(a+b)/2;
    if(f(c)<0)
        a=c;
    else
        b=c;
    end
end
fprintf("the root is found to be %f",c);