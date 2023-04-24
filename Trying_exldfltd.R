#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop extract fltd variants
#Drawback: open R from home directory only
for(i in 10){
  #The command to extract fltd snps and indels
  command<- paste0("cd Desktop/Tools/gatk-4.2.6.1/"," ; ","./gatk SelectVariants --exclude-filtered -V /media/apf/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_6_fltdsnps/filtered_snps.vcf -O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_8_excludefltd/bqsr_snps.vcf",
                   " ; ","./gatk SelectVariants --exclude-filtered -V /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_7_fltdindls/filtered_indels.vcf -O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_8_excludefltd/bqsr_indels.vcf")
  
  print(command)
  
  #To run the command on terminal
  system(command)
}