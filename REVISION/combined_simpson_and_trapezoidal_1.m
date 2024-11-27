clc;
interval=[4,8];
a=0;
b=2;
f=@(x) sqrt(1 + ((2*x) ./ (1 + (1 + x.^2).^2)).^2);
for i =1:length(interval)
    n=interval(i);
    h=(b-a)/n;
    sumTrap=0;
    for j=1:n-1
        x=a+h*j;
        sumTrap=sumTrap+2*f(x);
    end
    sumTrap=sumTrap+f(a)+f(b);
    ansTrap=h/2*sumTrap;

    sumSimpson=0;
    ansSimpson=nan;
    if(mod(n,2)==0)
        for j=1:n-1
            x=h+a*j;
            if(mod(j,2)==0)
                sumSimpson=sumSimpson+2*f(x);
            else
                sumSimpson=sumSimpson+4*f(x);
            end
        end
        sumSimpson=sumSimpson+f(a)+f(b);
        ansSimpson=h/3*sumSimpson;
    else
        fprintf("interval must be of even length \n");
    end
    fprintf("Interval :: %d\n",n);
    fprintf("Trap :: %f\n",ansTrap);
    fprintf("Simp :: %f\n\n",ansSimpson);
end