x = [0, 8, 16, 24, 32, 40];
y = [14.621, 11.843, 9.870, 8.418, 7.305, 6.413];

points_to_evaluate = [15, 27];
interpolated_values = zeros(size(points_to_evaluate));

for k = 1:length(points_to_evaluate)
    x_eval = points_to_evaluate(k);
    term_sum = 0;
    
    for i = 1:length(x)
        term = y(i);
        for j = 1:length(x)
            if j ~= i
                term = term * (x_eval - x(j)) / (x(i) - x(j));
            end
        end
        term_sum = term_sum + term;
    end
    
    interpolated_values(k) = term_sum;
end

for k = 1:length(points_to_evaluate)
    fprintf('Interpolated value at x = %d: %f\n', points_to_evaluate(k), interpolated_values(k));
end
