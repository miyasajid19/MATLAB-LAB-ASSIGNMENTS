A = [
    10, 8, -3, 1;
    2, 10, 1, -4;
    3, -4, 10, 1;
    2, 2, -3, 10;
];
B = [
    16;
    9;
    10;
    11;
];
X = [0; 0; 0; 0];
format short
X1 = [0; 0; 0; 0];

for k = 1:1000000
    for i = 1:4
        sum = 0;
        sum1 = 0;
        for j = 1:i-1
            sum = sum + A(i, j) * X1(j);
        end
        for j = i+1:4
            sum1 = sum1 + A(i, j) * X(j);
        end
        X1(i) = 1 / A(i, i) * (B(i) - sum - sum1);
    end
    
    % Display the values of X1 at each iteration
    disp(['Iteration ', num2str(k), ': X1 = ', mat2str(X1')]);
    
    % Check for convergence
    if (norm(X1 - X) < 10^(-5))
        disp('Converged Solution:');
        disp(X1);
        disp(['Total Iterations: ', num2str(k)]);
        break;
    end
    
    % Update X for the next iteration
    X = X1;
end
