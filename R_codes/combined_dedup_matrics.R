#This is to combine all the dedup_metrics into a table
#Allocating memory for the lines
files<-c()
#A loop to read all the files
for(i in 1:10){
  #Changing the directory to procure each file
  setwd(paste0("/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,
               "/Analysis/Step_2(MarkDuplicatesSpark)"))
  
  #procuring the file that is present in the directory
  files_to_be_read<- list.files(pattern = "*.txt")
  
  #reading all the lines in the file
  files_read<- readLines(files_to_be_read)
  
  #only line 7 in the file is header
  files[1]<- files_read[7]
  
  #all the line 8
  files[i+1]<- files_read[8]
}

#prepping the data to form a df
input_for_df<- strsplit(files,split = "\t")

#data frame
combined_df <- data.frame(matrix(unlist(input_for_df), nrow=length(input_for_df), 
                        byrow=TRUE),stringsAsFactors = FALSE)

#Changing the names of the columns
names(combined_df)<- combined_df[1,]
#Removing the name in the 1st row
combined_df_dedup<-combined_df[-1,]
