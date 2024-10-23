clc;
clear;

% Define the function and its derivative
f = @(x) atan(1 + x.^2);       % y = tan⁻¹(1 + x^2)
df = @(x) (2*x) ./ (1 + (1 + x.^2).^2);  % dy/dx for the given function

% Function for the integrand: sqrt(1 + (dy/dx)^2)
integrand = @(x) sqrt(1 + (df(x)).^2);

% Define the interval and number of subintervals
a = 0;
b = 2;
n_values = [4, 8];  % Subintervals to use

% Loop for Trapezoidal and Simpson's Rule
for n = n_values
    % Step size
    h = (b - a) / n;
    
    % x values for the subintervals
    x = a:h:b;
    
    % Trapezoidal Rule
    trapezoidal_sum = 0.5 * (integrand(a) + integrand(b));  % Endpoints
    for j = 1:n-1
        trapezoidal_sum = trapezoidal_sum + integrand(x(j+1));
    end
    trapezoidal_result = h * trapezoidal_sum;
    
    % Simpson's Rule (requires even n)
    if mod(n, 2) == 0
        simpson_sum = integrand(a) + integrand(b);
        for j = 1:n-1
            if mod(j, 2) == 0
                simpson_sum = simpson_sum + 2 * integrand(x(j+1));
            else
                simpson_sum = simpson_sum + 4 * integrand(x(j+1));
            end
        end
        simpson_result = (h / 3) * simpson_sum;
    else
        simpson_result = NaN;  % Not applicable if n is not even
    end
    
    % Display results
    fprintf("For n = %d subintervals:\n", n);
    fprintf("  Trapezoidal Method Result: %f\n", trapezoidal_result);
    if ~isnan(simpson_result)
        fprintf("  Simpson's Method Result: %f\n", simpson_result);
    else
        fprintf("  Simpson's Method is not applicable for odd n.\n");
    end
    fprintf('\n');
end
