datasciencecoursera
===================

###How the script works
1) First download zip data from coursera project page, such as A.zip

2) Unzip A.zip in the working directory of Rstudio

3) Run R code run_analysis.R

4) After 3) finished, two data set named cleanDat1 and cleanDat2 will be generated in the working directory of Rstudio

###Attention:
1) cleanDat1 and cleanDat2 correspond to first and second tidy data required to be generated by the course project.

2) cleanDat1: Combine train and test data, and add descriptive variable names and a column "activity" with activity labels.

3) cleanDat2: row.names are activity labels and subject numbers, measurement is the average of each variable.
