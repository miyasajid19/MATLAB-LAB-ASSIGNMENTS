f=@(x) 2*sin(x)-x;
g=@(x) 2*cos(x)-1;
e=0.00001;
j=1;
n=100;
h=1;
x=input('enter the no. of iterations dos you want ???');
for i=0:h:n
    if(f(i)*f(i+h)<0)
        a=i;
        b=i+h;
        fprintf("the interveral is [%f,%f]",a,b);
        break;
    end
end
x0=(a+b)/2;
while(j<=100)
    x1=x0-f(x0)/g(x0);
    if(abs(x1-x0)<e || (abs(x1-x0)/abs(x0)<e))
        fprintf("the root is %f",x1);
        break;
    else
        x0=x1;
    end
end
