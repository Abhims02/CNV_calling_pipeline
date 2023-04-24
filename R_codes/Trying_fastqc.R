#In the loop 1:the number of samples
#Works if each sample is present in different directory like showed(show a pictorial representation)
#Making loop to run fastq
for(i in 1:10){
  
  #To get to the directory
  setwd(paste0("/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i))
  
  #get files in the directory
  files<- list.files(pattern = "*.gz")
  
  #command to be run 
  to_do<- paste0("fastqc ", "-o ","/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis"," ","/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/",files[1]," ",
                "/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/",files[2])
  print(to_do)
  
  #To execute the command on terminal
  system(to_do)
}














###################(Unnecessary for now)

#For loading fastq files into R
#loading library ape to R
library(ape)
#A function to read fastq files
fastq_files<- function(file_name){
  #Empty vector to store the output
  read_files<- vector(mode = "list", length = 20)
  
  #Start of the iteration
  n = 0L
  
  #For loop for the function read.fastq
  for(i in file_name){
    n = n + 1L
    read_files[n]<- read.fastq(i)
  }
  
  return(read_files)
}

#Trying the function
files_ready_fastqc<- fastq_files(files_toberead)

