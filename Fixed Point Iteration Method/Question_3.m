format long;
clc;
g = @(x) tan(x) / 4;
e = 10^(-3);
n = 100;

initial_guess = 0.5;
increment = 0.5;
roots = [];
iterations = [];

while length(roots) < 2
    x0 = initial_guess;
    while i <= n
        x1 = g(x0);
        if abs(x1 - x0) < e || abs(x1 - x0) / abs(x1) < e
            if x1 > 0 && ~ismember(x1, roots)
                roots = [roots, x1];
                iterations = [iterations, i];
            end
            break;
        end
        x0 = x1;
        i = i + 1;
    end
    initial_guess = initial_guess + increment;
end

if length(roots) >= 2
    [sorted_roots, sort_idx] = sort(roots);
    fprintf('Smallest positive root: %f found in %d iterations\n', sorted_roots(1), iterations(sort_idx(1)));
    fprintf('Second smallest positive root: %f found in %d iterations\n', sorted_roots(2), iterations(sort_idx(2)));
else
    fprintf('Less than two positive roots were found.\n');
end
