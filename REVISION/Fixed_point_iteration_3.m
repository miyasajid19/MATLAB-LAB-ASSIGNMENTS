format long;
g=@(x) x-((2*sin(pi*x)+x)/(2*pi*cos(pi*x)+1));
x0=1;
for i=1:100000
    x1=g(x0);
    if(abs(x1-x)<0.01)
        break;
    end
    x0=x1;
end
x1