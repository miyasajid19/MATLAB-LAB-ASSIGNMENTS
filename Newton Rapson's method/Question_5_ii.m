f = @(x,y) x^2 + y^2 - 1;
g = @(x,y) 2*x^2 + 3*y^2 - 2;
fx = @(x,y) 2*x;
fy = @(x,y) 2*y;
gx = @(x,y) 4*x;
gy = @(x,y) 6*y;
X = [1; 1];
tol = 0.0001;
error = 1;
clc;
format long;
i=0;
while error > tol
    jacobian = [fx(X(1),X(2)), fy(X(1),X(2)); gx(X(1),X(2)), gy(X(1),X(2))];
    F = [f(X(1), X(2)); g(X(1), X(2))];
    X1 = X - inv(jacobian) * F;
    i
    X1
    error = max(abs(X1 - X)); 
    X = X1;
    i=i+1;
end
i
fprintf("the solution is :: ");
disp(X');
f(X(1), X(2)) % Should be close to 0
g(X(1), X(2)) % Should be close to 0
