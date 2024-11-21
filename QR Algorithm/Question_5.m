% Full Code for QR Algorithm
% --------------------------

function [eigenvalues, Ak] = qr_algorithm(A, max_iterations, tol)
    % QR algorithm to compute eigenvalues of a matrix A.
    % Input:
    %   A - Input square matrix
    %   max_iterations - Maximum number of iterations (default: 1000)
    %   tol - Tolerance for convergence (default: 1e-6)
    % Output:
    %   eigenvalues - Eigenvalues of matrix A
    %   Ak - Final matrix after QR iterations

    % Check if A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square for eigenvalue computation.');
    end

    % Set default parameters if not provided
    if nargin < 2
        max_iterations = 1000;
    end
    if nargin < 3
        tol = 1e-6;
    end

    % Initialize Ak
    Ak = A;

    % Perform QR iterations
    for k = 1:max_iterations
        % Compute QR decomposition of Ak using Gram-Schmidt process
        [Q, R] = qr_gram_schmidt(Ak);
        
        % Update Ak as R * Q
        Ak_next = R * Q;

        % Check for convergence
        if norm(Ak_next - Ak, 'fro') < tol
            break;
        end

        % Update Ak for next iteration
        Ak = Ak_next;
    end

    % Extract eigenvalues (diagonal of Ak)
    eigenvalues = diag(Ak);
end

% Gram-Schmidt QR Decomposition (Helper Function)
function [Q, R] = qr_gram_schmidt(A)
    % QR decomposition using Gram-Schmidt process.
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);
    
    for j = 1:n
        % Step 1: Start with the j-th column of A
        v = A(:, j);
        
        % Step 2: Make it orthogonal to previous Q columns
        for i = 1:j-1
            R(i, j) = Q(:, i)' * v;  % Project v onto Q(:, i)
            v = v - R(i, j) * Q(:, i);  % Subtract the projection from v
        end
        
        % Step 3: Normalize the resulting vector to form Q(:, j)
        R(j, j) = norm(v);  % R(j, j) is the norm of v
        Q(:, j) = v / R(j, j);  % Normalize v to create orthonormal Q(:, j)
    end
end

% Example Usage
% -------------
A = [1, 1, 0; 1, 0, 1; 0, 1, 1];

% Call the QR algorithm function
[eigenvalues, Ak] = qr_algorithm(A);

% Display results
fprintf('Input Matrix A:\n');
disp(A);

fprintf('Final Matrix Ak after QR iterations:\n');
disp(Ak);

fprintf('Eigenvalues of A:\n');
disp(eigenvalues);
