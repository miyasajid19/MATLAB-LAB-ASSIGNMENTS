g=@(x) (10/x-4*x)^(1/2);
e=10^(-3);
n=100;
x0=1.5;
i=0;
while(i<=n)
    x1=g(x0);
    if ((abs(x1-x0)<e) || (abs(x1-x0)/abs(x1))<e)
        break;
    end
    x0=x1;
    i=i+1;
end
disp('the root is found to be ');
disp(x1);
disp('the iteration count is ');
disp(i);