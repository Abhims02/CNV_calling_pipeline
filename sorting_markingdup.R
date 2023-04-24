#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop for sorting and marking duplicates
#Open R only from home directory
for(i in c(7,9,10)){
 
  #The command to sort and mark duplicates.
  command<- paste0("cd Desktop/Tools/gatk-4.2.6.1/"," ; ","./gatk MarkDuplicatesSpark -I /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,
                   "/Output/aligned_",i,".sam"," -M /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/dedup_metrics_",i,
                   ".txt"," -O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/sorted_dedup_reads_",i,".bam")
  
  print(command)
  
  #To execute the command on the command line
  system(command)
}

