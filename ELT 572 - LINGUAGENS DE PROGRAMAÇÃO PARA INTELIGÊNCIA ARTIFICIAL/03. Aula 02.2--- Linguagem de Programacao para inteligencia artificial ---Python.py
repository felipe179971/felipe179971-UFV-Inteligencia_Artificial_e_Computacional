#While 1
current_number=1
while current_number<=5:
  print(current_number)
  current_number+=1
;  
#While 2
prompt="\nDiga-me alguma coisa e eu vou repetir:"
prompt+="\nEntre 'pare' para terminar o programa."
message=""
while message!="pare":
  message=input(prompt)
  print(message)
#While 4
prompt="\nInforme o nome de uma cidade que você visitou:"
prompt+="\n(Digite 'pare' quando tiver informado a cidade."
active=True
while True:
  city=input(prompt)
  if city=='pare':
    break
  else:
    print(f"Eu gostaria de visitar {city.title()}!")
#While 5
current_number=0
while current_number<10:
  current_number+=1
  if current_number % 2==0:
    continue
  print(current_number)
#For1
fruits=["banana","uva","abacaxi","melancia"]
for x in fruits:
  print(x)
#For2
for x in "melancia":
  print(x)  
#For3 (de 0 até 4)
for x in range(5):
  print(x)
#For4 (de 2 até 5)
for x in range(2,6):
  print(x)

#For5 (de 0 até 20 indo de 4 em 4)
for x in range(0,21,4):
  print(x)
#Entrada e saída a partir de arquivos###########################################
#file1=open("Texte.txt","a")
#file1.close()
##• Somente leitura ('r')
##• Leitura e escrita ('r+')
##• Somente escrita ('w')
##• Leitura e escrita ('w+')
##• Somente acrescentar ('a')
##• Acrescentar e ler ('a+')
#file2=open(r"Texte.txt","w+")
#file2.close()
