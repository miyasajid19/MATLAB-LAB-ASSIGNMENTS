import numpy as np

# Initial arrays
tj = np.array((0, 0.4, -0.2, 0.25, 0, -0.25, 0.2, 0.4, 0)).reshape(3, 3)
print(tj)

# Vector c as a 3x1 matrix
c = np.array((2.2, 0.625, 0.2)).reshape(3, 1)

# Initial vector x
x = np.array([1, 0, 0]).reshape((3, 1))

# Iterative process
for i in range(3):
    y = tj * x + c  # Apply the operation tj * x + c element-wise
    x = y  # Update x for the next iteration
    print('\n\n')
    print(x)
    input()  # Wait for user input after each iteration
