library(mclust)
library(magrittr)
library(factoextra)
library(fpc)
library(NbClust)
MyData <- read.csv(file="C:/Users/Heisenberg/Downloads/dataset2.csv", header=TRUE, sep=",")
data_matrix <- MyData %>% na.omit()

#Elbow Method for finding the optimal number of clusters
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(data_matrix)

abline(v = 10, lty = 2)

set.seed(123)

km.res <- kmeans(data_matrix, 10, nstart = 25, trace=FALSE)

# BSS/TSS Ratio Calculation
km.res$withinss
km.res$betweenss
km.res$totss
km.res$betweenss/km.res$totss

# Visualize
fviz_cluster(km.res, data = data_matrix,
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal())





