% Given data points
x = [0, 8, 16, 24, 32, 40];
y = [14.621, 11.843, 9.870, 8.418, 7.305, 6.413];

% Initialize the Lagrange fundamentals array
l = zeros(length(x), length(x));

% Loop through each i to calculate Lagrange basis polynomials
for i = 1:length(x)
    % Initialize the Lagrange polynomial to 1
    li = ones(1, length(x));
    
    for j = 1:length(x)
        if j ~= i
            % Compute the terms of the Lagrange polynomial
            li = li .* ((x - x(j)) / (x(i) - x(j)));
        end
    end
    l(i,:) = li;  % Store the Lagrange polynomial for each i
end

% Initialize the Lagrange interpolating polynomial
P = zeros(1, length(x));

% Calculate the Lagrange interpolating polynomial
for i = 1:length(x)
    P = P + y(i) * l(i,:);  % Combine the Lagrange basis with y values
end

% Display the Lagrange interpolating polynomial coefficients
disp('Lagrange Interpolating Polynomial Coefficients:');
disp(P);

% Points to evaluate
points_to_evaluate = [15, 27,0, 8, 16, 24, 32, 40];
interpolated_values = zeros(size(points_to_evaluate));

% Evaluate the interpolating polynomial at specified points
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
    fprintf('Interpolated value at x = %d: %f\n', points_to_evaluate(k), interpolated_values(k));
end

% Optional: Plotting the original points and the interpolating polynomial
xx = linspace(min(x), max(x), 100);  % Fine grid for plotting
yy = zeros(size(xx));  % Initialize interpolated values

% Evaluate the interpolating polynomial at the grid points
for i = 1:length(x)
    % Calculate each term of the Lagrange polynomial at xx
    term = y(i);  % Start with the y value
    for j = 1:length(x)
        if j ~= i
            term = term .* (xx - x(j)) / (x(i) - x(j));  % Build the term using element-wise multiplication
        end
    end
    yy = yy + term;  % Add the term to the interpolated values
end

% Plot the results
figure;
plot(x, y, 'ro', 'MarkerFaceColor', 'r');  % Original points
hold on;
plot(xx, yy, 'b-');  % Interpolated polynomial
xlabel('x');
ylabel('P(x)');
title('Lagrange Interpolating Polynomial');
legend('Data Points', 'Interpolating Polynomial');
grid on;
