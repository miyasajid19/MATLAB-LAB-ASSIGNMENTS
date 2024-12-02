f=@(x) 2*sin(pi*x)+x;
g=@(x) x-(2*sin(pi*x)+1)/(2*pi*cos(pi* x)+1);
x=1;
for i=1:1000000
    x1=g(x);
    if(abs(x1-x)<0.00001)
        x=x1;break;
    end
    x=x1;
end
x
i