#This command requires invoking ggplot2
library(gplots)
library(ggplot2)
#library(gsalib)   ###Not available for this version of R
#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop extrat baserecali table
#Drawback: open R from home directory only
for(i in 1:10){
  #A command to create a recali table
  command<- paste0("cd /media/apugenomics/APU_Genomic_data/Tools/gatk-4.2.6.1"," ; ","./gatk AnalyzeCovariates -before /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_9_Bqsr_table/recal_data.table -after /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_11_basequalscore_recal/post_recal_data.table -plots /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_12_Analyze_covariants/recal_plots.pdf")
  
  print(command)
  
  #To run the command on the terminal
  system(command)
}