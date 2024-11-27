f=@(x) exp(-x)*(x^2+5*x+2)+1;
g=@(x) -exp(-x)*(x^2+5*x+2)+exp(-x)*(x*2+5);
x0=-1;
j=0;
while(j<=10000)
    if(g(x0)==0)
        error("Derivative is zero at x = %f. Newton-Raphson method fails.", x0);
    end
    x1=x0-f(x0)/g(x0);
    if(abs(x1-x0)<tol || (abs(x1-x0)/abs(x1))<tol)
        fprintf("Solution is converged at %d iterations.",j+1);
        fprintf("The solution is %f",x1);
        break;
    end
    x0=x1;
    j=j+1;
end
if(j>10000)
    error("not converged till 10000 iterations");
end
