#In the loop 1: number of samples present
#Works if each sample is present in different directory like showed(show a pictorial representation)
#A loop to convert SAM file to a BAM file
for(i in 1){
  
  #Changing the directory 1st
  setwd(paste0("/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/"))
  
  #getting the files in the directory
  files<- list.files(pattern = "*.sam")
  
  #Command to be run
  command<- paste0("cd ","/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/"," ; ","samtools view -S -b ",files," > aligned_",i,".bam")

  print(command)
  
  #Executing the command on terminal
  #system(command)
}
