f=@(x) exp(-x)*(x.^2+5*x+2)+1;
g=@(x) -exp(-x)*(x.^2+5*x+2)+(2*x+5)*exp(-x);
x0=-1;
i=0;
n=100;
e=0.00001;
while(i<=n)
    x1=x0-f(x0)/g(x0);
    if(abs(x1-x0)<e || (abs(x1-x0)/abs(x1))<e)
        disp('root is ');
        disp(x1);
        break;
    else
        x0=x1;
    end
end