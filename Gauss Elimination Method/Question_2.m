clc;
A = [10, 8, -3, 1, 16;
     2, 10, 1, -4, 9;
     3, -4, 10, 1, 10;
     2, 2, -3, 10, 11];

[n, m] = size(A);

% Forward elimination
for i = 1:n-1
    for j = i+1:n
        m = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - m * A(i,:);
    end
end

% Check for singularity
if A(n,n) == 0
    error('Matrix is singular or nearly singular');
end

% Back substitution
x = zeros(n, 1);
x(n) = A(n, end) / A(n, n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j) * x(j);
    end
    x(i) = (A(i, n+1) - sum) / A(i,i);
end

x
