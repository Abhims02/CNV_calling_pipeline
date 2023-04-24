#This is to procure alignment_metrics of the control sample
#Changing the directory to where the control metrics are
setwd("/media/apf/APU_Genomic_data/Sample_NDD/control_align/Analysis")

#Procuring the .txt files from the directory
files_to_be_read<- list.files(pattern = "*.txt")

#Reading both files separately
files_read1<- readLines(files_to_be_read[1])

files_read2<- readLines(files_to_be_read[2])

##################################working with 1st file(files_read1)
#Allocating memory for the lines
files<-c()

#Tentative step to club 8,9,10 line
files_need_lines<-paste0(files_read1[8],files_read1[9],files_read1[10])


#only line 7 in the file is header
files[1]<- files_read1[7]

#Inputting line 7,8,9 into the vector
files[2]<- files_need_lines

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
combined_df_ali_ctrl<-combined_df[-1,]


######################################working with the 2nd file(files_read2)
#Allocating memory for the lines
files<-c()

#only line 7 in the file is header
files[1]<- files_read2[7]

#all the line 8
files[2]<- files_read2[8]

#prepping the data to form a df
input_for_df<- strsplit(files,split = "\t")

#data frame
combined_df <- data.frame(matrix(unlist(input_for_df), nrow=length(input_for_df), 
                                 byrow=TRUE),stringsAsFactors = FALSE)

#Changing the names of the columns
names(combined_df)<- combined_df[1,]
#Removing the name in the 1st row
combined_df_dedup_ctlr<-combined_df[-1,]


