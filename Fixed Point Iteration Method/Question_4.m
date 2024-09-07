format long;
clc;
g=@(x) x-((2*sin(2*pi*x)+x)/(4*pi*cos(pi*x)+1));
n=100;
i=0;
x0=1;
while(i<=n)
    x1=g(x0);
    if ((abs(x1-x0)<e) || (abs(x1-x0)/abs(x1))<e)
        break;
    end
    x0=x1;
    i=i+1;
end
fprintf('the root is found to be %f in %d iterations',x1,i);