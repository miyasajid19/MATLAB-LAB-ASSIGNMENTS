f=@(x) 1/(x* log(x));
a=exp(1);
b=exp(1)+1;
interval=[4,6,10,20];
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

    ansSim=nan;
    if(mod(n,2)==0)
        sumSimp=0;
        for j=1:n
            x=a+h*j;
            if(mod(i,2)==0)
                sumSimp=sumSimp+2*f(x);
            else
                sumSimp=sumSimp+4*f(x);
            end
            sumSimp=sumSimp+f(a)+f(b);
            ansSim=h/3*sumSimp;
        end
    else
        fprintf("Invalid interval");
    end

    fprintf("Interval :: %d\n",n);
    fprintf("Trap :: %f\n",ansTrap);
    fprintf("Simp :: %f\n\n",ansSim);
end