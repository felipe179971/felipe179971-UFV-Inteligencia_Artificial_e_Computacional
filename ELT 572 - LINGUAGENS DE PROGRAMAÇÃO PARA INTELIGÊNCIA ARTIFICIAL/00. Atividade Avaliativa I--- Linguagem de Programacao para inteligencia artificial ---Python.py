#Questao 4:
x=[i for i in range(0,101)]
#a
for nota in x:
  if nota >= 90 and nota <= 100:
    print("Conceito A [%d]" % nota)
  elif nota >= 80 and nota <= 89:
    print("Conceito B [%d]" % nota)
  elif nota >= 70 and nota <=79:
    print("Conceito C [%d]" % nota)
  elif nota <= 70:
    print("Conceito D: reprovado [%d]" % nota)
#b
for nota in x:
  if nota >= 90:
    print("Conceito A [%d]" % nota)
  elif nota >= 80:
    print("Conceito B [%d]" % nota)
  elif nota >= 70:
    print("Conceito C [%d]" % nota)
  else:
    print("Conceito D: reprovado [%d]" % nota)
#c
for nota in x:
  if nota >= 90 and nota <= 100:
    print("Conceito A [%d]" % nota)
  elif nota >= 80 and nota <= 89:
    print("Conceito B [%d]" % nota)
  elif nota >= 70 and nota <=79:
    print("Conceito C [%d]" % nota)
  else:
    print("Conceito D: reprovado [%d]" % nota)
#d
for nota in x:
  if nota >= 90 and nota <= 100:
    print("Conceito A [%d]" % nota)
  elif nota >= 80 and nota <= 89:
    print("Conceito B [%d]" % nota)
  elif nota >= 70 and nota <=79:
    print("Conceito C [%d]" % nota)
  else:
    print("Conceito D: reprovado [%d]" % nota)
#e
for nota in x:
  if nota >= 90:
    print("Conceito A [%d]" % nota)
  elif nota >= 80:
    print("Conceito B [%d]" % nota)
  elif nota >= 70:
    print("Conceito C [%d]" % nota)
  else:
    print("Conceito D: reprovado [%d]" % nota)
#Questao 5:
while True:
  nota = float( input('Entre com uma nota entre 0 e 100: '))
  if nota < 0 or nota > 100:
    print('Valor incorreto.')
  else:
    break
