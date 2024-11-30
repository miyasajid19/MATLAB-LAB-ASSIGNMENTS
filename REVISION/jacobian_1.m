f = @(x, y) x^2 + y^2 - 1;
g = @(x, y) 2*x^2 + 3*y^2 - 2;

% Partial derivatives
df1 = @(x, y) 2*x;      % ∂f/∂x
df2 = @(x, y) 2*y;      % ∂f/∂y
dg1 = @(x, y) 4*x;      % ∂g/∂x
dg2 = @(x, y) 6*y;      % ∂g/∂y

% Initial guess
x = [1; 1];
tol = 1e-5;
error = 1;
j = 1;

while error > tol
    % Jacobian matrix
    J = [
        df1(x(1), x(2)), df2(x(1), x(2));
        dg1(x(1), x(2)), dg2(x(1), x(2))
    ];
    % Function values
    F = [f(x(1), x(2)); g(x(1), x(2))];
    % Newton-Raphson step
    x1 = x - J \ F;
    % Update error
    error = max(abs(x1 - x));
    x = x1;
    j = j + 1;
end
format long
disp('Solution:');
disp(x);
disp('Number of iterations:');
disp(j);
