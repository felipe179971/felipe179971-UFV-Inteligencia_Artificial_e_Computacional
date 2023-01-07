#install.packages("mlbench")
library(mlbench) #banco de dados BostonHousing
library(dplyr)
library(tidyr)
dados=BreastCancer%>%dplyr::select(-c(Id,Class))%>%dplyr::mutate(dplyr::across(.cols=everything(),~as.numeric(.)))%>%tidyr::drop_na()
pr.out=prcomp(dados, scale=TRUE)
pr.out
#pr.out$rotation=-pr.out$rotation
#pr.out$x=-pr.out$x
ggbiplot(pcobj=pr.out, obs.scale = 1, var.scale = 1,
         groups = dados$Clas%>%as.character(),ellipse = TRUE, 
         circle = TRUE,labels = dados$Class ) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')+theme_minimal()

ggbiplot(pcobj=pr.out, obs.scale = 1, var.scale = 1,
         groups = NULL,ellipse = TRUE, 
         circle = TRUE,labels = NULL ) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')+theme_minimal()

#K-mean
library(factoextra)
library(cluster)

#load data
dados=BreastCancer%>%dplyr::select(-c(Id,Class))%>%dplyr::mutate(dplyr::across(.cols=everything(),~as.numeric(.)))%>%tidyr::drop_na()

df <- dados

#remove rows with missing values
df <- na.omit(df)

#scale each variable to have a mean of 0 and sd of 1
df <- scale(df)

#view first six rows of dataset
head(df)

factoextra::fviz_nbclust(df, kmeans, method = "wss")+geom_vline(xintercept = 5,linetype="dotted",color="red",size=1)
##calculate gap statistic based on number of clusters
#gap_stat <- clusGap(df,
#                    FUN = kmeans,
#                    nstart = 25,
#                    K.max = 10,
#                    B = 50)
#
#plot number of clusters vs. gap statistic
#fviz_gap_stat(gap_stat)
#make this example reproducible
set.seed(2)

#perform k-means clustering with k = 4 clusters
km <- kmeans(df, centers =2)
km$tot.withinss
#view results
km
#factoextra::fviz_cluster(km, data = df)

df2<-dados%>%dplyr::mutate(classificado=km[["cluster"]])

pr.out=prcomp(df2%>%dplyr::select(-classificado), scale=TRUE)
#pr.out$rotation=-pr.out$rotation
#pr.out$x=-pr.out$x
ggbiplot(pcobj=pr.out, obs.scale = 1, var.scale = 1,
         groups = df2$classificado%>%as.character(),ellipse = TRUE, 
         circle = TRUE,labels = dados$Class ) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')+theme_minimal()
