g=@(x) 0.5* (10-x^3)^(1/2);
e=10^(-3);
n=1000;
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
fprintf('the root is found to be %f in %d iterations',x1,i);