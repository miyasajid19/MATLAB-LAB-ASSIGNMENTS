clc;
interval=[4,6,10,20];
a=1;
b=-1;
f=@(x) exp(-1*(x)^2)*cos(x);
for i =1:length(interval)
    n=interval(i);
    h=(b-a)/n;
    sumTrap=0;
    for j=1:n-1
        x=a+h*j;
        sumTrap=sumTrap+2*f(x);
    end
    sumTrap=sumTrap+f(a)+f(b);
    ansTrap=(h/2)*sumTrap;

    %simpson's rule
    ansSimp=nan;
    if(mod(n,2)==0)
        sumSimpson=0;
        for j=1:n-1
            x=a+j*h;
            if(mod(j,2)==0)
                sumSimpson=sumSimpson+2*f(x);
            else
                sumSimpson=sumSimpson+4*f(x);
            end
        end
        sumSimpson=sumSimpson+f(a)+f(b);
        ansSimp=(h/3)*sumSimpson;
    
    else
        fprintf("Interval is found to be odd and its is invlaid, n=%d\n",n)
    end

    fprintf("Interval :: %d\n",n);
    fprintf("Trapezoidal ::%f\n ",ansTrap);
    fprintf("Simpson's :: %f\n\n",ansSimp)
end