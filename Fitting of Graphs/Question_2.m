x = [-2,-1,0,1,2];
y = [15,1,1,3,19];
ysum = 0;
xsum = 0;
xy = 0;
x2 = 0;
for i = 1:length(x)
    ysum = ysum + y(i);
    xsum = xsum + x(i);
    xy = xy + x(i)*y(i);
    x2 = x2 + x(i)^2;
end
length(x)
A = [length(x), xsum, ysum; xsum, x2, xy];

n = 2;
for i = 1:2
    if A(i,i) == 0
        for j = i+1:n
            if A(j,i) ~= 0
                A([i, j], :) = A([j, i], :);
                disp(['Swapped row ', num2str(i), ' with row ', num2str(j)]);
                break;
            end
        end
    end
    if A(i,i) ~= 0
        for j = i+1:n
            factor = A(j,i) / A(i,i);
            A(j,:) = A(j,:) - factor * A(i,:);
        end
    end
end

disp('Upper triangular matrix A:');
disp(A);

x_sol = zeros(n, 1);
for i = n:-1:1
    x_sol(i) = (A(i,end) - A(i, 1:end-1) * x_sol) / A(i,i);
end
disp(['The linear equation is: y = ', num2str(x_sol(1)),' x + (', num2str(x_sol(2)),')']);