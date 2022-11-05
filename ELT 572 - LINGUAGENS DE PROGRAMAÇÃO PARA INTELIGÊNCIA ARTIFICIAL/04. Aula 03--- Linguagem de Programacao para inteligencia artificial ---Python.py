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
a="Diga Olá!"
print("Caracter de índice 1...")
print(a[1]) #acessa elemento do string
#percorre elemento do string 1 a 1 
for i in a:
  print(i,end='\n')
#percorre string com passo 2
print("Imprime string...")
for i in range (0,len(a),2): #len(a) é uma função que retorna o tamanho do string a

  print(a[i],end="\n")
#percorre elemento do string 1 a 1 
print("Imprime string...")
for i in range (0,len(a),1):
  print(a[i],end="\n")
#Matrizes#######################################################################
import numpy as np
#le dimensoes da matriz
nl=int(input("Informe o numero de linhas: "))
nc=int(input("Informa o numero de colunas: "))
#cria matriz
A=np.empty((nl,nc))
#le do teclado
for i in range (0,nl):#linhas vao de 0 a nl-1
  for j in range(0,nc): #coluans vao de 0 a nc-1
    s='Informe o elemento A[%d][%d]: ' % (i,j)
    A[i][j]=float(input(s))
print("Imprime matriz...")
for i in range(0,nl):
  for j in range(0,nc):
    print('%5.1f' % (A[i][j]),end='')
  print() #imprime quebra de linha
