import numpy as np

# Gram-Schmidt process to orthogonalize a set of vectors
def gram_schmidt(A):
    """
    Perform Gram-Schmidt orthogonalization on matrix A.
    Returns Q (orthogonal matrix) and R (upper triangular matrix)
    """
    m, n = A.shape
    Q = np.zeros((m, n))
    R = np.zeros((n, n))
    
    for j in range(n):
        v = A[:, j]
        for i in range(j):
            R[i, j] = np.dot(Q[:, i], v)
            v = v - R[i, j] * Q[:, i]
        R[j, j] = np.linalg.norm(v)
        Q[:, j] = v / R[j, j]
        
    return Q, R

# QR decomposition using Gram-Schmidt
def qr_decomposition(A):
    """
    Perform QR decomposition using the Gram-Schmidt process.
    """
    Q, R = gram_schmidt(A)
    return Q, R

# QR Algorithm to compute eigenvalues
def qr_algorithm(A, max_iter=100, tolerance=1e-9):
    """
    QR algorithm to find the eigenvalues of matrix A.
    Parameters:
        A (numpy.ndarray): The matrix for which eigenvalues are to be computed.
        max_iter (int): Maximum number of iterations.
        tolerance (float): Convergence tolerance.
    Returns:
        (numpy.ndarray): Eigenvalues of the matrix A.
    """
    A_curr = A.copy()
    for i in range(max_iter):
        Q, R = qr_decomposition(A_curr)
        A_next = np.dot(R, Q)
        
        # Check for convergence (if the off-diagonal elements are very small)
        off_diagonal_norm = np.linalg.norm(A_next - np.diag(np.diagonal(A_next)))
        if off_diagonal_norm < tolerance:
            break
        
        A_curr = A_next
    
    # Return the diagonal elements (eigenvalues)
    return np.diagonal(A_curr)

# Example usage:
A = np.array([
    [1,1,0],
    [1,0,1],
    [0,1,1]
], dtype=float)

# Compute eigenvalues using the QR algorithm
eigenvalues = qr_algorithm(A)
print("Eigenvalues:", eigenvalues)
