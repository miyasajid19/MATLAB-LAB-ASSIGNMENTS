f = @(x) 1/(x * log(x));  % Define the function

a = exp(1);  % Lower bound
b = exp(1) + 1;  % Upper bound
interval = [4, 6, 10, 20];  % Different values for n (number of intervals)

for i = 1:length(interval)
    n = interval(i);
    h = (b - a) / n;  % Step size
    
    % Trapezoidal Rule
    sumTrap = 0;
    for j = 1:n-1
        x = a + h * j;
        sumTrap = sumTrap + 2 * f(x);
    end
    sumTrap = sumTrap + f(a) + f(b);  % Add the first and last terms
    ansTrap = h / 2 * sumTrap;  % Final result for the trapezoidal rule
    
    % Simpson's Rule (only works if n is even)
    if mod(n, 2) == 0
        sumSimp = f(a) + f(b);  % Start with the boundary values
        for j = 1:n-1
            x = a + h * j;
            if mod(j, 2) == 0  % Even index (multiply by 2)
                sumSimp = sumSimp + 2 * f(x);
            else  % Odd index (multiply by 4)
                sumSimp = sumSimp + 4 * f(x);
            end
        end
        ansSim = h / 3 * sumSimp;  % Final result for Simpson's rule
    else
        ansSim = NaN;  % Invalid for odd n
        fprintf("Simpson's Rule only works for even n.\n");
    end
    
    % Display the results
    fprintf("Interval: %d\n", n);
    fprintf("Trapezoidal Rule Result: %f\n", ansTrap);
    fprintf("Simpson's Rule Result: %f\n\n", ansSim);
end
