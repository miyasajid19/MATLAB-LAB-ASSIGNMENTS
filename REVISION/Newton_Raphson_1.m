f = @(x) x^2 - 17;
g = @(x) 2*x;

n = 100;
h = 100;
tol = 1e-5;
a = nan;
b = nan;

for i = -n:h:n
    if f(i) * f(i + h) < 0
        a = i;
        b = i + h;
        break;
    end
end

if isnan(a) || isnan(b)
    error("No interval containing the root was found in the given range.");
end

j = 0;
x0 = (a + b) / 2;

while j <= 10000
    if g(x0) == 0
        error("Derivative is zero at x = %f. Newton-Raphson method fails.", x0);
    end
    
    x1 = x0 - f(x0) / g(x0);
    
    if abs(x1 - x0) < tol || abs(x1 - x0) / abs(x0) < tol
        fprintf("The required root is %f\n", x1);
        fprintf("Converged in %d iterations.\n", j + 1);
        break;
    end
    
    x0 = x1;
    j = j + 1;
end

if j > 10000
    error("The method did not converge within 10000 iterations.");
end
