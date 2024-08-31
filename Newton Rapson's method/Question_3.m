f = @(t) 9 * exp(-t) .* sin(2 * pi * t) - 3.5;
g = @(t) 9 * exp(-t) .* (-sin(2 * pi * t) + 2 * pi * cos(2 * pi * t));
e = 0.00001;
j = 1;
n = 100;
h = 0.1;

a = NaN;
b = NaN;

for i = 0:h:n
    if f(i) * f(i + h) < 0
        a = i;
        b = i + h;
        fprintf("The interval is [%f, %f]\n", a, b);
        break;
    end
end

if isnan(a) || isnan(b)
    disp('No interval was found where the function changes sign.');
else
    x0 = (a + b) / 2;

    while j <= n
        x1 = x0 - f(x0) / g(x0);

        if abs(x1 - x0) < e || (abs(x1 - x0) / abs(x0) < e)
            fprintf("The lowest value of t such that i = 3.5 is %f seconds\n", x1);
            break;
        else
            x0 = x1;
        end

        j = j + 1;
    end

    if j > n
        disp('The root was not found within the specified iterations.');
    end
end
