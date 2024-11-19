clc;
A = [
    5, 5, 0, 0, 0, 5.5;
    0, 0, 1, -1, -1, 0;
    0, 0, 0, 2, -3, 0;
    0, 5, -7, -2, 0, 0;
    1, -2, -1, 0, 0, 0;
];

[n, m] = size(A);

% Forward elimination
for i = 1:n-1
    % Check for zero pivot
    if A(i,i) == 0
        % Try to find a row below to swap with
        for k = i+1:n
            if A(k,i) ~= 0
                % Swap rows
                A([i, k], :) = A([k, i], :);
                break;  % Exit the loop once a swap is done
            end
        end
    end

    % Check again if the pivot is still zero after swapping
    if A(i,i) == 0
        error('Matrix is singular or nearly singular. No valid pivot found.');
    end
   
    % Elimination process
    for j = i+1:n
        m = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - m * A(i,:);
    end
end

% Check for singularity in the last pivot
if A(n,n) == 0
    error('Matrix is singular or nearly singular at the last pivot.');
end

% Back substitution
x = zeros(n, 1);
x(n) = A(n, end) / A(n, n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j) * x(j);
    end
    x(i) = (A(i, end) - sum) / A(i,i);
end

x