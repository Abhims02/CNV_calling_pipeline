#I need to read the file onto R
# setting the directory to read the file eonto R
setwd("/media/apugenomics/APU_Genomic_data/XHMM_test/TEST/Test_mydata_namechange/Output")

#reading the file
data<- read.table("DATA_for_R.xcnv", header = TRUE, sep = "")

needed_numb<- c(1,5,5,4,4,3,3,8,8,8,8,7,6,6,10,10)

#making a for loop to run the command
for(i in 1:nrow(data)){
  command<- paste0("time samplot plot -n ",data$SAMPLE[i]," -b /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   needed_numb[i],"/Output/recal_reads_alt",
                   needed_numb[i],".bam -o /media/apugenomics/APU_Genomic_data/XHMM_test/TEST/Test_mydata_namechange/Analysis/recal_reads_alt",
                   needed_numb[i],"_",data$CNV[i],"_",i,
                   ".png -c ",data$chr[i]," -s ",data$start[i]," -e ",data$stop[i]," -t ",data$CNV[i])
  
  #printing command
  print(command)
  
  #running it on command line
  system(command)
}

##################################################################

#changing the dir to confirer calls
setwd("/media/apugenomics/APU_Genomic_data/Conifer_test/Output")

#reading the file
data_c1<- read.table("calls_1.txt", header = TRUE, sep = "")

#reading the file
data_c2<- read.table("calls_2.txt", header = TRUE, sep = "")

needed_numb_c1<- c(5,10,3,10,5,4,6,9,8)

needed_numb_c2<- c(5,10,4,6,9)

#making a for loop to run the command
#for(i in 1:nrow(data_c1)){
 # command<- paste0("time samplot plot -n ",data_c1$sampleID[i]," -b /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
  #                 needed_numb_c1[i],"/Output/recal_reads_alt",
   #                needed_numb_c1[i],".bam -o /media/apugenomics/APU_Genomic_data/Conifer_test/Analysis/read_depth_calls1/recal_reads_alt",
    #               needed_numb_c1[i],"_",data_c1$state[i],"_",i,
     #              ".png -c ",data_c1$chromosome[i]," -s ",data_c1$start[i]," -e ",data_c1$stop[i]," -t ",data_c1$state[i])
  
  #printing command
#  print(command)
  
  #running it on command line
 # system(command)
#}


#making a for loop to run the command for 2nd table
for(i in 1:nrow(data_c2)){
  command<- paste0("time samplot plot -n ",data_c2$sampleID[i]," -b /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   needed_numb_c2[i],"/Output/recal_reads_alt",
                   needed_numb_c2[i],".bam -o /media/apugenomics/APU_Genomic_data/Conifer_test/Analysis/read_depth_calls2/recal_reads_alt",
                   needed_numb_c2[i],"_",data_c2$state[i],"_",i,
                   ".png -c ",data_c2$chromosome[i]," -s ",data_c2$start[i]," -e ",data_c2$stop[i]," -t ",data_c2$state[i])
  
  #printing command
  print(command)
  
  #running it on command line
  system(command)
}



