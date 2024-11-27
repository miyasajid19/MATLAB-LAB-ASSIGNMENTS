function [Ak] = qr_algorithm(A)
    [m, n] = size(A);
    if m ~= n
        error('Matrix must be square.');
    end
    Ak = A;
    for k = 1:1000
        Q = sajid(Ak);
        R = inv(Q) * Ak;
        Ak_next = R * Q;
        if norm(Ak_next - Ak) < 0.0001
            break;
        end
     
        Ak = Ak_next;
    end
end

function [Q] = sajid(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    temp = zeros(n, n);
    for j = 1:n
        v = A(:, j);
        for i = 1:j-1
            temp(i, j) = Q(:, i)' * v;
            v = v - temp(i, j) * Q(:, i);
        end
        temp(j, j) = norm(v);
        Q(:, j) = v / temp(j, j);
    end
end

A = [1,1,0;1,0,1;0,1,1];
Ak = qr_algorithm(A);
disp(Ak);
disp( diag(Ak))