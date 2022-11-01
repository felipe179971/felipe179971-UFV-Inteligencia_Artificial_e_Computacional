import numpy as np
################################################################################
#Vetores 1
notas=np.empty(5)#vetor de float, pode ser lixo na memoria
print("notas = ",notas)
#Vetores 2
notas2=np.zeros(5)#vetor de float inicializado com 0
print("notas2 = ",notas2)
#Vetores 3
idades=np.zeros(5,dtype=int)#vetor de inteiros inicializado com 0
print("idades = ",idades)
#Vetores 4
contador=np.array([4,3,2,1])#inicialização criada
print("contador = ",contador)
#Vetores########################################################################
n=int(input("Informe o número de elementos: "))
A=np.empty(n)#cria arranjo
#le do teclado
for i in range(0,n):
  A[i]=float(input("Informe o %dº elemento: "%(i+1)))
#multiplicar o vetor por 3
for i in range(0,n):
  A[i]=A[i]*3
#escreve na tela com formatacao
print("Imprimindo vetor na tela...")
for i in range(0,n):
  print("%5.2f"%A[i],end=";") #Comprimento 5 e 2 casas decimais
print()
#Strings########################################################################
print(2)





