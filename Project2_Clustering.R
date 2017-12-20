#Function to Read File
readfile <- function(path_data){
  return (read.csv(file=path_data, header=TRUE, sep=","));
}

#Forms clusters based on given data set using the KMeans Algorithm. 
myKMEANS <- function(data_matrix){
  km.res <- kmeans(data_matrix, 8, nstart = 25)
  return (km.res)
}

#Forms clusters based on given data set using the hierarchical clustering Algorithm.
myHCLUST <- function(data_matrix){
  # Compute hierarchical clustering
  res.hc <- data_matrix %>%
    dist(method = "euclidean") %>% # Compute dissimilarity matrix
    hclust(method = "ward.D2")     # Compute hierachical clustering
  return (res.hc)
}

#Forms clusters based on given data set using the DBSCAN clustering Algorithm.
myDBSCAN <- function(data_matrix){
  kNNdistplot(data_matrix, k =  8)
  abline(h = 1.463, lty = 2)
  db <- fpc::dbscan(data_matrix, eps = 1.463, MinPts = 8)
  return (db)
  }

#Forms clusters based on given data set using the Shared Nearest Neighbor Clustering Algorithm.
mySNNCLUST <- function(data_matrix){
  kNNdistplot(data_matrix, k =  8)
  abline(h = 1.8, lty = 2)
  snn <- dbscan::sNNclust(data_matrix, k = 10, eps = 1.8, minPts = 10,borderPoints = TRUE)
  return (snn)
}

#install.packages(c("factoextra","magrittr","fpc","rgl","car","ClusterR","mclust","dbscan"))
library(factoextra)
library(magrittr)
library(fpc)
library(rgl)
library(car)
library(ClusterR)
library(mclust)
library(dbscan)

set.seed(1234) #SET SEED VALUES HERE

MyData <-readfile("C:/Users/Heisenberg/Downloads/dataset1.csv") #SET DATASET_FILEPATH HERE TO YOUR PATH
data_matrix <- as.matrix(MyData[, -4])
# Prepare Data
data_matrix <- na.omit(data_matrix) # listwise deletion of missing

labels <- MyData$cluster


#Implementation for Kmeans Algorithm
kmeans_clust <- myKMEANS(data_matrix)
# Visualize using factoextra
fviz_cluster(kmeans_clust, data = data_matrix,
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal())
reskm = external_validation(labels, kmeans_clust$cluster, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the original data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z, surface=FALSE, grid = FALSE, point.col = labels)
#Scatter Plot of the clustered data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,point.col = kmeans_clust$cluster, surface=FALSE, grid = FALSE)


#Implementation for Hierarchical Clustering Algorithm
hier_clust <- myHCLUST(data_matrix)
# Visualize using factoextra
# Cut in 8 groups and color by groups
fviz_dend(hier_clust, k = 8, # Cut in eight groups
          cex = 0.5, # label size
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)
predictions <- cutree(hier_clust, k = 8 )
reshc = external_validation(labels, predictions, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the original data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z, surface=FALSE, grid = FALSE, point.col = labels)
#Scatter Plot of the clustered data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,surface=FALSE, grid = FALSE, point.col = predictions)


#Implementation for DBSCAN clustering Algorithm
dbscan_clust <- myDBSCAN(data_matrix)
# Plot DBSCAN results
fviz_cluster(dbscan_clust, data = data_matrix, stand = FALSE,
             ellipse = FALSE, show.clust.cent = FALSE,
             geom = "point",palette = "jco", ggtheme = theme_classic())
resdb = external_validation(labels, dbscan_clust$cluster, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the original data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z, surface=FALSE, grid = FALSE, point.col = labels)
#Scatter Plot of the clustered data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,point.col = dbscan_clust$cluster + 1, surface=FALSE, grid = FALSE)

#Implementation for Shared Nearest Neighbor Clustering
snn_clust <- mySNNCLUST(data_matrix)
ressc = external_validation(labels, snn_clust$cluster, method = "adjusted_rand_index", summary_stats = T)
#Scatter Plot of the original data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z, surface=FALSE, grid = FALSE, point.col = labels)
#Scatter Plot of the clustered data
open3d()
scatter3d(x = MyData$x, y = MyData$y, z = MyData$z,point.col = snn_clust$cluster + 1, surface=FALSE, grid = FALSE)

