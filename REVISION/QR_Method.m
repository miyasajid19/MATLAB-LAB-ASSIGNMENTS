function main
    A = [
        1, 1, 0;
        1, 0, 1;
        0, 1, 1;
    ];
    Ak = qr_iteration(A);
    disp('Diagonal elements of Ak (eigenvalues):');
    disp(diag(Ak));
    disp('Final Ak matrix:');
    disp(Ak);
end

function [Q] = gram_schmidt(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    for i = 1:n
        v = A(:, i);
        for j = 1:i-1
            projection = (Q(:, j)' * v) / (Q(:, j)' * Q(:, j));
            v = v - projection * Q(:, j);
        end
        Q(:, i) = v / norm(v);
    end
end

function [Ak] = qr_iteration(A)
    [m, n] = size(A);
    if m ~= n
        error("Matrix must be square.");
    end
    Ak = A;
    for i = 1:1000
        Q = gram_schmidt(Ak);
        R = Q' * Ak;
        Ak_next = R * Q;
        if norm(Ak_next - Ak) < 1e-6
            Ak = Ak_next;
            break;
        end
        Ak = Ak_next;
    end
end
