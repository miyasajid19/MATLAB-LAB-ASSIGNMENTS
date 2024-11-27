x = [-2,-1,0,1,2];
y = [12,1,1,3,19];

X = 0;
Y = 0;
XX = 0;
XY = 0;

% Summing the necessary values
for i = 1:length(x)
    X = X + x(i);
    Y = Y + y(i);
    XX = XX + x(i) * x(i);
    XY = XY + x(i) * y(i);
end

% Construct the augmented matrix for the system of equations
A = [length(x), X, Y; X, XX, XY];

% Forward elimination
for i = 1:2
    if (A(i,i) == 0)
        for j = i+1:2
            if (A(j,i) ~= 0)
                A([i,j], :) = A([j,i], :); % Swap rows
            end
        end
    end
    if (A(i,i) == 0)
        error("Can't solve");
    end
    
    % Perform Gaussian elimination
    for j = i+1:2
        m = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - m * A(i,:);
    end
end

% Check for infinite solutions
if (A(2,2) == 0)
    error("Infinite solution");
end

% Backward substitution
x_vals = zeros(2,1);  % Initialize solution vector
x_vals(2) = A(2,end) / A(2,2);  % Solve for x(2)

% Perform backward substitution for the first unknown
for j = 1:1
    sum = 0;
    for k = j+1:2
        sum = sum + A(j,k) * x_vals(k); % Correct summation term
    end
    x_vals(j) = (A(j,end) - sum) / A(j,j);
end

% Display the solution
disp(x_vals)
