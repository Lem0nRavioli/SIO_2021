# python script
# en cas d'erreur, cmd => pip install numpy
import numpy as np

A = np.array([[0,1],[2,3]])
B = np.array([[-1,0],[3,2]])

# squared matrix, can also be done with np.dot(A,A)
Asquared = np.linalg.matrix_power(A,2)
Bsquared = np.linalg.matrix_power(B,2)


AplusB = A + B

# A²+2.A x B + B² == np.dot(A,A) + 2*np.dot(A,B) + np.dot(B,B)
print(Asquared + Bsquared + 2 * np.dot(A,B))
print(Asquared + Bsquared + np.dot(A,B) + np.dot(B,A))
print(np.linalg.matrix_power(AplusB,2))


# (A + B)² == A² + AxB + BxA + B² 