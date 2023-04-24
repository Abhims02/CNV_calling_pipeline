#In the loop 1:the number of samples 
#Works if each sample is present in directories like showed(show a picture)
#A loop to run bwa
for(i in 3){
  
  #Changing the directory
  setwd(paste0("/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i))
  
  #Getting the files the directory
  files<-list.files(pattern = "*.gz")
  
  #Command to run
  command<- paste0("cd /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output"," ; ","bwa mem -K 100000000 -Y -R '@RG\\tID:",
                   "sample_",i,"\\tLB:","sample_",i,"\\tPL:ILLUMINA\\tPM:HISEQ\\tSM:",
                   "sample_",i,"' ../../Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz ",
                   "/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/",files[1]," ","/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/",files[2]," > aligned_",i,".sam")
  
  print(command)
  
  #To execute the command on the command line
  #system(command)
}



################################(Second loop for a .bam output)


#A loop to run bwa
for(i in 10){
  
  #Changing the directory
  setwd(paste0("/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i))
  
  #Getting the files the directory
  files<-list.files(pattern = "*.gz")
  
  
  #Command to run
  command<- paste0("cd /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output"," ; ","bwa mem -K 100000000 -Y -R '@RG\\tID:",
                   "sample_",i,"\\tLB:","sample_",i,"\\tPL:ILLUMINA\\tPM:HISEQ\\tSM:",
                   "sample_",i,"' ../../Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz ",
                   "/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/",files[1]," ","/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/",files[2]," > aligned_",i,".sam",
                   " ; ", "samtools view -S -b aligned_",i,".sam > aligned_",i,".bam")
  
  print(command)
  
  #To execute the command on the command line
  system(command)
  
  
}















