% Step 1: Generate eight equally spaced points in the interval [0, 2*pi]
n_points = 8;
x = linspace(0, 2*pi, n_points);  % 8 equally spaced points
y = sin(x).^2;  % Calculate f(x) = sin^2(x)
format long
% Display the points and their corresponding function values
disp('Equally spaced points and their function values:');
c=1;
for i = 1:n_points
    fprintf('%f x = %.2f, f(x) = %.4f\n',i, x(i), y(i));
end

% Step 2: Points to evaluate using Lagrange interpolation
points_to_evaluate = [0.5, 3.5, 5.5, 6];
interpolated_values = zeros(size(points_to_evaluate));

% Step 3: Evaluate the interpolating polynomial at specified points
for k = 1:length(points_to_evaluate)
    x_eval = points_to_evaluate(k);
    term_sum = 0;  % Initialize sum for the polynomial value
    
    for i = 1:length(x)
        % Calculate each term of the Lagrange polynomial at x_eval
        term = y(i);  % Start with the y value
        for j = 1:length(x)
            if j ~= i
                term = term * (x_eval - x(j)) / (x(i) - x(j));  % Build the term
            end
        end
        term_sum = term_sum + term;  % Add the term to the sum
    end
    
    interpolated_values(k) = term_sum;  % Store the interpolated value
end

% Display the interpolated values
for k = 1:length(points_to_evaluate)
    fprintf('Interpolated value at x = %.2f: %.4f\n', points_to_evaluate(k), interpolated_values(k));
end
