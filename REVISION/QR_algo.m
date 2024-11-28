function [Q] = gram_schmidt(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    for i = 1:n
        v = A(:, i);
        for j = 1:i-1
            proj = Q(:, j)' * v;  % Projection of v onto Q(:, j)
            v = v -  Q(:, j)*proj;  % Subtract the projection
        end
        Q(:, i) = v / norm(v);  % Normalize the vector
    end
end

function [Ak] = qr(A)
    [n, m] = size(A);
    if n ~= m
        error("Square matrix is required.");
    end
    Ak = A;
    for i = 1:10000
        Q = gram_schmidt(Ak);  % Apply Gram-Schmidt to get Q
        R = inv(Q) * Ak;  % Compute R (Q' * Ak)
        Ak_next = R * Q;  % Update Ak (R * Q)
        
        % Check for convergence
        if norm(Ak_next - Ak) < 1e-5
            Ak = Ak_next;
            break;
        end
        Ak = Ak_next;  % Continue to next iteration
    end
end
A = [1, 1, 0; 
     1, 0, 1; 
     0, 1, 1];
Ak = qr(A);
diag(Ak)  % Eigenvalues are the diagonal elements of Ak
