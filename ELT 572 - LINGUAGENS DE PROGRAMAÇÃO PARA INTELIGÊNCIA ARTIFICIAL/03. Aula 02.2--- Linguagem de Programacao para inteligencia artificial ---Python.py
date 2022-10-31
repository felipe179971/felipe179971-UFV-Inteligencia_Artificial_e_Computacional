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
