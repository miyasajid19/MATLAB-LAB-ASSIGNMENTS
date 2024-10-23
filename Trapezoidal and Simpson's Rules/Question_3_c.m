clc;
clear;

% Define the interval and function
a = -1;
b = 1;
f = @(x) (exp(-1*x^2)*cos(x));

% Number of subdivisions
n = [4, 6, 10, 20];

% Loop over different values of n
for i = 1:length(n)
    % Trapezoidal Method
    h = (b - a) / n(i);  % Calculate step size
    sum_trapezoidal = 0;
    
    % Summation for Trapezoidal Rule
    for j = 1:n(i) - 1
        x = a + j * h;
        sum_trapezoidal = sum_trapezoidal + 2 * f(x);
    end
    
    % Add the endpoints
    sum_trapezoidal = sum_trapezoidal + f(a) + f(b);
    answer_trapezoidal = (h / 2) * sum_trapezoidal;
    
    % Display result for Trapezoidal Method
    fprintf("The result in Trapezoidal Method is %f for n = %d\n", answer_trapezoidal, n(i));
    
    % Simpson's Method (requires even number of intervals)
    if mod(n(i), 2) == 0  % Ensure n is even for Simpson's Rule
        sum_simpson = 0;
        
        % Summation for Simpson's Rule
        for j = 1:n(i) - 1
            x = a + j * h;
            if mod(j, 2) == 0
                sum_simpson = sum_simpson + 2 * f(x);
            else
                sum_simpson = sum_simpson + 4 * f(x);
            end
        end
        
        % Add the endpoints
        sum_simpson = sum_simpson + f(a) + f(b);
        answer_simpson = (h / 3) * sum_simpson;
        
        % Display result for Simpson's Method
        fprintf("The result in Simpson's Method is %f for n = %d\n", answer_simpson, n(i));
    else
        fprintf("Simpson's Method is not applicable for n = %d (must be even)\n", n(i));
    end
    
    fprintf('\n');
end
