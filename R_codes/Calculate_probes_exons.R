#Loading dplyr into R
library(dplyr)

#Reading the annotated file onto R
hg_19<- read.table("annotated_Twist_Comprehensive_Exome_targets_hg19.bed",
                    sep = "\t",stringsAsFactors = FALSE)

#Filtering all the values that have a 4th column value
hg_19_4col<- hg_19 %>%
  filter(V4 != "")

#Adding another column to the data.frame
hg_19_4col$V5 = NA

#For loop to find the difference between V3 and V4
for(i in 1:nrow(hg_19_4col)){
  hg_19_4col$V5[i] = hg_19_4col$V3[i] - hg_19_4col$V2[i]
}

#Finding the sum of the fifth column 
sum(hg_19_4col$V5)

#The total coverage the target probes are 35,623,765 - the annotated hg-19 bed file
##The coverage for gene file - 26,921,649,617
## the coverage for exone file - 301,824,779 
## liftover T2T_coverage - 37,022,339 
