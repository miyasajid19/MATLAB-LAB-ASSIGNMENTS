clc;
A = [pi, 2^(1/2), -1, 1, 0;
     exp(1), -1, 1, 2, 1;
     1, 1,-1*3^(1/2),1, 2;
     -1, -1, 1, -1*5^(1/2), 3];

[n, m] = size(A);
for i = 1:n-1
    for j = i+1:n
        m = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - m * A(i,:);
    end
end

if A(n,n) == 0
    error('Matrix is singular or nearly singular');
end

x = zeros(n, 1);
x(n) = A(n, end) / A(n, n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i,j) * x(j);
    end
    x(i) = (A(i, n+1) - sum) / A(i,i);
end
A
x
