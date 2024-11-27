A = [
    1,1,0,0;
    1,2,0,1;
    0,0,3,3;
    0,1,2,3;
    ]; % Defining matrix A

x = [1; 1; 0;1]; % Initial guess for eigenvector
k = 0; % Initial guess for eigenvalue

for i = 1:10000
    y = A * x; % Calculate y = A * x
    k1 = max(abs(y)); % Find the largest magnitude of y and assign to k1
    x1 = (1 / k1) * y; % Normalize y to obtain the next approximation of the eigenvector
    
    % Check for convergence in eigenvalue approximation
    if abs(k - k1) < 10^-3
        x = x1; % Update eigenvector
        k = k1; % Update eigenvalue
        break;
    end
    
    % Update for next iteration
    x = x1;
    k = k1;
end

% Display the final results
disp('Estimated Eigenvector (normalized):');
disp(x1);

disp('Largest Eigenvalue:');
disp(k);

disp('Total Iterations:');
disp(i);
