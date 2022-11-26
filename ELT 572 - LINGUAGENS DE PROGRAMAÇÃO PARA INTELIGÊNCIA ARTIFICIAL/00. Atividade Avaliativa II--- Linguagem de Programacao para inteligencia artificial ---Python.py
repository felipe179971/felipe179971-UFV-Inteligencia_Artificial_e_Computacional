#vetor de numeros flutuantes (todos sendo 0)
np.zeros(6)
#vetor de numeros inteiros (todos sendo 0)
np.zeros(6,dtype=int)
#vetor de numeros flutuantes (todos sem valor especifico)
np.empty(6)

np.empty((4,3))


def fatorial( n ):
    fat = 1
    for i in range(2, n+1):
        fat = fat * i
    return fat
fatorial(5)


import numpy as np
m = int(input("Informe m: "))
matriz = np.empty((m,m))
for i in range(0, m):
    for j in range(0, m):
        matriz[i][j] = int(input("Informe o elemento [%d][%d]: "%(i,j)))

p = 1
for i in range(0, m):
    p = p * matriz[i][i]
print('\nO resultado é =', p )
