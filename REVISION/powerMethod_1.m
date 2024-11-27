clc;
A = [
    4, 1, -1, 1;
    1, 4, -1, -1;
    -1, -1, 5, 1;
    1, -1, 1, 3;
];

k = 1000;
x = [1; 1; 1; 1];

for i = 1:100000
    y = A * x;
    k1 = max(abs(y));
    x1 = y / k1;
    
    if abs(k1 - k) < 0.00001
        k = k1;
        break;
    end
    
    x = x1;
    k = k1;
end

fprintf("The largest eigenvalue is %f\n", k);