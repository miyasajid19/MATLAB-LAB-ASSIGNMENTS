f = @(x, y) x^2 + x*y + y^2 - 7;
g = @(x, y) x^3 + y^3 - 9;

df1 = @(x, y) 2*x + y;
df2 = @(x, y) x + 2*y;

dg1 = @(x, y) 3*x^2;
dg2 = @(x, y) 3*y^2;

x = [1.5; 0.5];  % Initial guess as a column vector
tol = 0.0001;    % Convergence tolerance
error = 1;       % Initial error set to be larger than tolerance
i = 0;           % Initialize the iteration counter

while (error > tol)
    % Jacobian matrix
    J = [
        df1(x(1), x(2)), df2(x(1), x(2));
        dg1(x(1), x(2)), dg2(x(1), x(2))
    ];
    
    % Function values
    F = [f(x(1), x(2)); g(x(1), x(2))];
    
    % Update the solution vector
    x1 = x - inv(J)*F;  % Use backslash for solving the linear system
    
    % Compute the error
    error = max(abs(x1 - x));
    
    % Increment iteration counter
    i = i + 1;
    
    % Update the solution vector
    x = x1;
end

X = x1;

% Output results
fprintf("--------------------------------------------------\n");
fprintf("Converged after %d iterations.\n", i);
fprintf("The solution is :: X1 = %.6f, X2 = %.6f\n", X(1), X(2));
fprintf("f(X) = %.10f (should be close to 0)\n", f(X(1), X(2)));
fprintf("g(X) = %.10f (should be close to 0)\n", g(X(1), X(2)));
