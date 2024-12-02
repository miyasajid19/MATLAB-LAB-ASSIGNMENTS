f=@(x) x^2-25;
tol=0.001;
for i=0:100
    if(f(i)*f(i+1)<0)
        a=i;
        b=i+1;
    end
end
n=(log(b-a)-log(tol))/log(2);
for i=1:n
    c=(a+b)/2;
    if(abs(b-a)<tol)
        break;
    end
    if(f(c)<0)
        a=c;
    else
        b=c;
    end
    
end
c