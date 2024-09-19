f = @(x1,x2,x3) 3*x1 - cos(x1*x2)-1/2;
g = @(x1,x2,x3) x1^2 - 81*(x2+0.1)^2 + sin(x3) + 1.06;
h = @(x1,x2,x3) exp(-x1*x2) + 20*x3 + (10*pi - 3)/3;

% Partial derivatives (Jacobian entries)
fx1 = @(x1,x2,x3) 3 + x2*sin(x1*x2);
fx2 = @(x1,x2,x3) x1*sin(x1*x2);
fx3 = @(x1,x2,x3) 0;

gx1 = @(x1,x2,x3) 2*x1;
gx2 = @(x1,x2,x3) -2*81*(x2+0.1);
gx3 = @(x1,x2,x3) cos(x3);

hx1 = @(x1,x2,x3) -x2*exp(-x1*x2);
hx2 = @(x1,x2,x3) -x1*exp(-x1*x2);
hx3 = @(x1,x2,x3) 20;

% Initial guess
X = [0.1; 0.1; -0.1];
tol = 0.0001;
error = 1;

clc;
format long;
 i=0;
while error > tol
    % Jacobian matrix
    jacobian = [fx1(X(1), X(2), X(3)), fx2(X(1), X(2), X(3)), fx3(X(1), X(2), X(3));
                gx1(X(1), X(2), X(3)), gx2(X(1), X(2), X(3)), gx3(X(1), X(2), X(3));
                hx1(X(1), X(2), X(3)), hx2(X(1), X(2), X(3)), hx3(X(1), X(2), X(3))];
    
    % Function values at current X
    F = [f(X(1), X(2), X(3)); g(X(1), X(2), X(3)); h(X(1), X(2), X(3))];
    
    % Update X using Newton's method
    X1 = X - inv(jacobian) * F;
    
    % Compute error
    error = max(abs(X1 - X));
    i=i+1;
    % Update X
    X = X1;
end

% Display the final solution
fprintf("The solution is ::\n ");
disp(X);

i
% Check how close the function values are to zero
fprintf("f(X) = %.6f\n", f(X(1), X(2), X(3)));
fprintf("g(X) = %.6f\n", g(X(1), X(2), X(3)));
fprintf("h(X) = %.6f\n", h(X(1), X(2), X(3)));
