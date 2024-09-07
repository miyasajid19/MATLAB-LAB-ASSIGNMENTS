g=@(x) x-((x^3+4*x^2-10)/(3*x^2+8*x));
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
fprintf('the root is found to be %f in %d iterations',x1,i);