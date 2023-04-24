library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(IMIFA)
#Reading all the CSV files
data_needed_col<- read.csv("Columns.csv")
data_needed_row<- read.csv("Rows.csv")
data_needed_exp<- read.csv("Expression_mod.csv",
                           col.names = c("pi4kap2", "pi4ka", "pi4kap1"))

#Adding 2 data frames
data_clubbed <- cbind(data_needed_col, data_needed_exp)

#Filtering for age and expression of genes
fltd_age <- data_clubbed %>%
  select(donor_age, pi4kap2, pi4ka, pi4kap1)

df_1<- t(fltd_age[,c(2,3,4)])
colnames(df_1) = fltd_age$donor_age

#Removing columns from 21 years 
df_2 <- df_1[ ,-c(432:524)]

#making it a matrix
matrix_analysis<- as.matrix(df_2)

#bar plots for the genes
barplot(fltd_age$Pi4kap2, names.arg = fltd_age$donor_age, 
        xlab = "Age", ylab = "log2 normalised RPKM values",
        main = "log2 RPKM normalised gene expression of PI4KAP2 vs age")
barplot(fltd_age$pi4ka, names.arg = fltd_age$donor_age, xlab = "Age", ylab = "log2 normalised RPKM values",
        main = "log2 RPKM normalised gene expression of PI4KA vs age")

#basic heat map
heatmap(x = matrix_analysis,Colv = NA ,xlab = "Age", margins = c(4,9))
heat_legend(matrix_analysis)


