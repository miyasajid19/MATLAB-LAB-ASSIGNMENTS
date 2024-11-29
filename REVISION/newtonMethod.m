f=@(x) x-2*sin(x);
g=@(x) 1-2*cos(x);
h=1;
for i=1:100
    if(f(i)+f(i+h)<0)
        a=i;
        b=i+h;
        break;
    end
end
while(abs(a-b)>0.00000001)
    c=(a+b)/2;
    if(f(c)<0)
        a=c;
    else
        b=c;
    end

end
fprintf("the soution is %f using bisection method\n",a)
x=a;
for i=1:100000
    x1=x-f(x)/g(x);
    if(abs(x1-x)<0.00000001)
        x=x1;
        break;
    end
    x=x1;
end
fprintf("the soution is %f using newton method",x)
i