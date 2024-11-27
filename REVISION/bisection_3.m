A = 1.129241e-3;

B = 2.341077e-4;
C = 8.775468e-8;

function T_kelvin = temperature_to_kelvin(T_celsius)
    T_kelvin = T_celsius + 273.15;
end

function f = equation(R, T, A, B, C)
    f = A + B * log(R) + C * (log(R))^3 - 1/T;
end

function R_solution = bisection_method(func, T, a, b, tol, max_iter, A, B, C)
    if func(a, T, A, B, C) * func(b, T, A, B, C) > 0
        error('The function must have opposite signs at the interval endpoints.');
    end
    
    iter_count = 0;
    while (b - a) / 2 > tol && iter_count < max_iter
        c = (a + b) / 2; 
        if func(c, T, A, B, C) == 0 
            R_solution = c;
            return;
        elseif func(a, T, A, B, C) * func(c, T, A, B, C) < 0
            b = c; 
        else
            a = c; 
        end
        
        iter_count = iter_count + 1;
    end
    
    R_solution = (a + b) / 2;
end

function R = find_resistance_bisection(T, A, B, C)
    R_min = 1e-5; 
    R_max = 1e5; 
    
    tol = 1e-6;
    max_iter = 100; 
    R_solution = bisection_method(@equation, T, R_min, R_max, tol, max_iter, A, B, C);
    
    R = R_solution;
end

T_celsius = 18.99;
T_kelvin = temperature_to_kelvin(T_celsius);
R = find_resistance_bisection(T_kelvin, A, B, C);

fprintf('Resistance at T = %.2f °C (Kelvin: %.2f): %.4f ohms\n', T_celsius, T_kelvin, R);
