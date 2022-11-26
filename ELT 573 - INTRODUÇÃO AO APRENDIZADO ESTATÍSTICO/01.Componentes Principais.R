#Na mao#########################################################################
#Dados
(dados<-data.frame(t=c(1,2,3,4,5),x1=c(102,104,101,93,100),x2=c(96,87,62,68,77)))
#Obtendo a matrix de covariancia
(S<-var(dados[,-1]))#menos a coluna de identificacao (t)
#Obtendo os autovalores e autovetores
(autos<-eigen(S))
#Escores
(dad<-as.matrix(dados[,-1]))
(escores1<-dad%*%autos$vectors)#Dados originais multiplicados pelo peso 
#Percentual de explicacao
(percent_explic<-autos$values/sum(diag(S)))
#O primeiro componente explica aproximadamente 94% dos dados
#O segundo componente explica aproximadamente 6% dos dados
#Cleam Environment in R
rm(list=ls())

#Exemplo2)
dados<-iris
(S<-var(dados[,-5]))#menos a coluna de identificacao (t)
#Obtendo os autovalores e autovetores
(autos<-eigen(S))
#Escores
(dad<-as.matrix(dados[,-5]))
(escores1<-dad%*%autos$vectors)#Dados originais multiplicados pelo peso 
#Percentual de explicacao
(percent_explic<-autos$values/sum(diag(S)))
#O primeiro componente explica aproximadamente 93% dos dados
#O segundo componente explica aproximadamente 5% dos dados
#...

#Funcao do R####################################################################
#Banco de dado Iris 
#Obter informacos sobre o conjunto de dados iris
data(iris)
#Apresentar as seis primeiras linhas do conjunto de dados
head(iris)
#Verificar dimensa do conjunto de dados
dim(iris)
#Componentes principais
pca_Cov <- princomp(iris[,-5], cor = FALSE, scores = TRUE)
summary(pca_Cov)
#O primeiro componente explica aproximadamente 92.46187% dos dados
#O segundo componente explica aproximadamente 5.306648% dos dados
#...
#verificando os pesos
pca_Cov$loadings
#Scores
head(pca_Cov$scores)
#Analise grafica
par(mfrow=c(1,2))
biplot(pca_Cov)
#como nao estou trabalhando com os dados padronizados, ou seja, trabalho com a 
#matrix de convariancia cor=FALSE, as setas indicam a importancia da variavel
#Provavlmente, a "Pedal.Leng" seja mais importante que as outras (deviso a seta ser maior)
#Alem disso, a direcao da seta apresenta a correlacao entre a variavel e a componente. 
#Portanto,"Petal.Width","Petal.Length" e "Sepal.Length" sao positivamente correlacionadas 
#com o primeiro componente e "Sepal.Width" e negativamente correlacionada com CP1

#Agora considerando os dados padronizados (a matrix de correlacao)
pca_Cor <- princomp(iris[,-5], cor = TRUE, scores = TRUE)
summary(pca_Cor)
biplot(pca_Cor)
#Aqui, todas as setas tem o mesmo tamanho (nao indicam a importanci da variavel, como 
#no caso do cp com matrix de covariancia cor=FALSE)
variancias<-apply(dados[,-5], 2, var)
variancias
