clc;
f=@(x) x^3+4*x^2-10;
a=1;
b=2;
tol=10^(-3);
N=(log(b-a)-log(tol))/log(2);
fprintf("the function requires %d iterations",ceil(N));