clc;
x = [0,0.25,0.5,0.75]; 
D = zeros(4, 4); 
% Initialize the first column of D with known values 
D(1, 1)=1; 
D(2, 1) = 1.64872; 
D(3, 1) = 2.71828; 
D(4, 1) =4.4816; 
% Calculate divided differences
for i = 2:length(x) 
    % Start from 2 since D(:,1) is already populated 
    for j = i:length(x)
        % Ensure j starts from i 
        D(j, i) = (D(j, i-1) - D(j-1, i-1)) / (x(j) - x(j-i+1)); 
    end 
end 
product = zeros(1, length(x)); 
p = 0.43; 
% Calculate products
for i = 1:length(x) 
    product(i) = 1; 
    for j = 1:i-1 
        product(i) = product(i) * (p - x(j)); 
    end 
end 
% Calculate the final sum using the divided differences and products 
sum = 0; 
for i = 1:length(x) 
    sum = sum + (D(i, i) * product(i));
    % Use the correct index for D 
end 
sum