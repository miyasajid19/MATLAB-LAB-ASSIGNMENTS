f = @(t) 9 * exp(-t) .* sin(2 * pi * t) - 3.5;
g = @(t) 9 * exp(-t) .* (-sin(2 * pi * t) + 2 * pi * cos(2 * pi * t));
h=0.1;
n=100;
a=nan;
b=nan;
for i =0:h:n
    if(f(i)*f(i+h)<0)
        a=i;
        b=i+h;
        break;
    end
end
if(isnan(a) || isnan(b))
    error("not found");
end
a
b
x=(a+b)/2;
j=0;
while j<=10000
    x1=x-f(x)/g(x);
    if(abs(x1-x)<0.00001)
        break;
        
    end
    x=x1;
    j=j+1;
end
x1
j