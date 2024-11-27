% Coefficient matrix
A = [
    10, 8, -3, 1;
    2, 10, 1, -4;
    3, -4, 10, 1;
    2, 2, -3, 10
];

% Right-hand side vector
b = [16; 9; 10; 11];

% Initial guess
x0 = zeros(size(b));
x1 = zeros(size(b));

% Dimensions of matrix
[n, ~] = size(A);

% Maximum iterations and tolerance
max_iter = 10000;
tol = 1e-5;

% Gauss-Seidel Iterative Method
for k = 1:max_iter
    for i = 1:n
        sum = 0;
        for j = 1:i-1
            sum = sum + A(i, j) * x1(j); % Use updated x1 values
        end
        for j = i+1:n
            sum = sum + A(i, j) * x0(j); % Use old x0 values
        end
        x1(i) = (b(i) - sum) / A(i, i); % Update x1 for the current iteration
    end
    % Check for convergence
    if norm(x1 - x0) < tol
        fprintf('Converged in %d iterations.\n', k);
        disp('Solution:');
        disp(x1);
        break;
    end
    % Update x0 for the next iteration
    x0 = x1;
end

if k == max_iter
    fprintf('Did not converge within %d iterations.\n', max_iter);
end
