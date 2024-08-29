
n = input('Enter number of iterations: ');
h = 0.1;
T = 273.15 + 18.99;
f = @(R) -1/T + (1.129241*10^-3 + 2.341077*10^-4 * log10(R) + 8.775468*10^-8 * (log10(R)).^3);

for i = 0:h:n
    if (f(i) * f(i + h) < 0)
        a = i;
        b = i + h;
       
    break;
    end

end

e = 10^(-3);
while abs(a - b) > e
    c = (a + b) / 2;
    if f(c) * f(a) < 0
        b = c;
    else
        a = c;
    end
end
disp('a')
disp(a)
disp('b')
disp(b)
fprintf('The resistance R at 18.990°C is approximately %.4f ohms.\n', c);
fprintf('f(c) = %f\n', f(c));
