N=10;
h=1;
f=@(x) x.^2-29;
e=1*10^(-3);
for i=-N:h:N
    if(f(i)*f(i+h))<0
        a=i;
        b=i+h;
    end
end
while(abs(a-b)>e)
    c=(a+b)/2;
    if(f(c)*f(a)<0)
        b=c;
    else
        a=c;
    end
end
fprintf('The required root is %.3f\n', c);