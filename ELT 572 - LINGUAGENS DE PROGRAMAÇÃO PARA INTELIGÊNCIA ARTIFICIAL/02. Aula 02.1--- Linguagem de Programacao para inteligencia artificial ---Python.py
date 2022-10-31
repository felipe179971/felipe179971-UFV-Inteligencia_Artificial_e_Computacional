#Atribuição#####################################################################
x=5+3
#Entrada e saída padrão#########################################################
#Input stringr
input("Dig alguma coisa e eu vou repetir: ")
#Input numérico
idade=int(input("Qual sua idade? "))
print(idade)
altura=float(input("Qual sua idade? "))
print(altura)
#print
print("banana")
print("banana","maça","abacaxi")
print("banana","maça","abacaxi",sep=",")
print("banana","maça","abacaxi",sep=",",end="-")
#Estruturas condicionais
age=15
if age>=18:
  print("Você tem a idade mínima para dirigir.")
else:
  print("Você ainda não tem a idade mínima para dirigir.")
  
age=19
if age<16:
  print("Você ainda não pode votar.")
elif age<18:
  print("Você já pode votar.")
elif age<70:
  print("O voto é obrigatório.")
else:
  print("Você pode votar.")
#Operadores lógicos#############################################################
x=True;y=True;x and y
x=True;y=False;x and y
x=False;y=False;x and y

x=True;not x
#Exemplo: nota do aluno#########################################################
nota=float(input("Nota final: "))
if nota<0 or nota>100:
  print("Nota informada é inválida.")
elif nota>=60:
  print("Aluno aprovado.")
elif nota>=40:
  print("Aluno tem direito a prova final.")
else: 
  print("Aluno reprovado")




