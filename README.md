# Data Mining Clustering
The goal of the project is to increase familiarity with the clustering packages, available in R to do data mining analysis on real-world problems. Several different clustering methods were used on the given datasets. The dataset was as provided. The original cluster column was used as initial label for comparison. kMeans, Hierarchical, DBScan and SNNClust were the clustering methods used on the smaller data set and kMeans was chosen for large data set.

-------------------------------------------------------
 INTRO TO DATA MINING - PROJECT 2 CLUSTERING 
-------------------------------------------------------

CONTENTS OF THIS FILE 
---------------------
    
 * Introduction
 * Requirements
 * Installation and Configuration
 * Developer information


INTRODUCTION
------------
The main project folder contains the following files:

          - Project2_Clustering.R
          - Project2_Clustering2.R
	  - dataset1.csv
	  - dataset2.csv
	  - Project2_Clustering_Report.pdf
          - Readme.txt


REQUIREMENTS
------------
RStudio (latest version)

The following need to be installed to run the project:
* factoextra
* magrittr
* fpc
* rgl
* car
* ClusterR
* mclust
* dbscan

These packages can be installed by running the following command 
-> install.packages(c("factoextra","magrittr","fpc","rgl","car","ClusterR","mclust","dbscan"))


INSTALLATION AND CONFIGURATION
------------------------------
1. Set the DATASET_FILEPATH parameter in Project2_Clustering.R to the complete file path of the input dataset1 (shared in the zipped folder).
2. Execute the functions in the beginning of the Project2_Clustering.R file to load them into the R environment.
3. Set the seed to the following values : 123 (Main Seed), 1234, 1111, 2222 and 3333 to obtain the results in the report.
4. After setting each seed value run the script immediately after the functions in Project2_Clustering.R to get the clustering results and associated graphs.(Note : Visualization of Dendogram for Hierarchical might take some time to generate graph. You can comment it out to save time)
5. Set the DATASET_FILEPATH parameter in Project2_Clustering2.R to the complete file path of the input dataset2 (shared in the zipped folder).
6. Run the entire script with default seed values in Project2_Clustering2.R to get the clustering results and associated graphs.(Note : Visualization of Clustering Graph might take some time. You can comment it out to save time)

DEVELOPER INFORMATION
---------------------

  Aniketh Sukhtankar (UF ID 7819 9584) asukhtankar@ufl.edu
