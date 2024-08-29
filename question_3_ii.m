a=1;
b=2;
e=0.001;
f=@(x) x.^3+4*x^2-10;
n=(log(b-a)-log(e))/(log(2));
fprintf("total no of iterations required is ::: %f",n)
