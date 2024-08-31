f=@(x) x.^2-17;
g=@(x) 2*x;
i=1;
n=100;
%tolerance
e=0.00001;
x0=4;
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