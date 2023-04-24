#This is to combine all the alignment_metrics into a table
#Allocating memory for the lines
files<-c()
#A loop to read all the files
for(i in 1:10){
  #Changing the directory to procure each file
  setwd(paste0("/media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,
               "/Analysis/Step_3(Alignmentmet&depth)"))
  
  #procuring the file that is present in the directory
  files_to_be_read<- list.files(pattern = "*rics.txt")
  
  #reading all the lines in the file
  files_read<- readLines(files_to_be_read)
  
  #Tentative step to club 8,9,10 line
  files_need_lines<-paste0(files_read[8],files_read[9],files_read[10])
  
  
  #only line 7 in the file is header
  files[1]<- files_read[7]
  
  #all the line 8
  files[i+1]<- files_need_lines
}

#prepping the data to form a df
input_for_df<- strsplit(files,split = "\t\t\t")
input_for_df<- strsplit(unlist(input_for_df), split = "\t")
input_vec<- input_for_df[[1]][-c(34,35,36)]
input_for_df[[1]]<- input_vec

#data frame
combined_df <- data.frame(matrix(unlist(input_for_df), nrow=length(input_for_df), 
                                 byrow=TRUE),stringsAsFactors = FALSE)

#Changing the names of the columns
names(combined_df)<- combined_df[1,]
#Removing the name in the 1st row
combined_df_ali<-combined_df[-1,]


#Adding another column of sample number to the data.frame
#pre-allocating memory for the vector
new_col<- vector(mode = "list", 10L)

#A loop to get the names repeated
for(i in 1:10){
  #Putting in the repeated values into a list
  new_col[[i]]<- rep(paste0("Sample_",i),3)
  
}

#unlisting it to create a vector
new_col_vec<- unlist(new_col)

#Adding it to the data.frame
combined_df_ali<- cbind(new_col_vec, combined_df_ali)
colnames(combined_df_ali)[1]<- "Samples"



