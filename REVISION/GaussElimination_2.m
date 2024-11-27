clc;
A = [
    5, 5, 0, 0, 0, 5.5;
    0, 0, 1, -1, -1, 0;
    0, 0, 0, 2, -3, 0;
    0, 5, -7, -2, 0, 0;
    1, -2, -1, 0, 0, 0;
];

% Forward elimination
[n, m] = size(A);
for i = 1:n
    if A(i,i) == 0
        for j = i+1:n
            if A(j,i) ~= 0
                % Swap rows if pivot is zero and non-zero element is found
                A([i,j], :) = A([j,i], :);
                disp("swap");
                break;
            end
        end
    end
    
    if A(i,i) == 0
        error("Matrix is singular or near singular");
    end
    
    % Eliminate the elements below the pivot
    for j = i+1:n
        m = A(j,i) / A(i,i);  % Calculate the multiplier
        A(j,:) = A(j,:) - m * A(i,:);  % Perform the row operation
    end
end

if A(n,n) == 0
    error("Infinite solutions");
end

% Backward substitution
x = zeros(n, 1);
x(n) = A(n,end) / A(n,n);  % Set the last variable
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j) * x(j);  % Calculate sum for the current variable
    end
    x(i) = (A(i,end) - sum) / A(i,i);  % Calculate the current variable
end

disp(x);  % Display the solution
