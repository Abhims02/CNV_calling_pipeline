#Creating gene annotations for the calls file in XHMM and Conifer
#loading package data.table, dplyr and GenomicRanges
library(data.table)
library(dplyr)
library(GenomicRanges)

setwd("/media/apugenomics/APU_Genomic_data/Sample_NDD/Input/annotations")
#Reading the annotations file into R
annotations<- fread("GCF_namechanged_for_R.gtf",
                    data.table=FALSE, stringsAsFactors=FALSE,sep="\t")
annotations<- annotations[which(annotations[,3] == "gene"),]

#amending the table annotations
annotations$V9 = gsub(";.*", "", annotations$V9)
annotations$V9 = gsub("gene_id ", "", annotations$V9)

#Considering only the required columns in the table
ref_annotations<- annotations %>%
  select(`#!annotation-source NCBI Homo sapiens Annotation Release 110`,
         V4,V5,V9)
colnames(ref_annotations) <- c("Chr", "Start", "Stop", "gene")


#Using GenomicRanges to create a new class of the data.frame for annotations
annotations_gr<- GRanges(ref_annotations[,1], IRanges(ref_annotations[,2],
                                                      ref_annotations[,3], 
                                                      names = ref_annotations[,4]))


#Now we read the calls file from conifer to check if there are matching 
#coordinates (Remember to change the directory to the place where the calls 
#file are)

setwd("/media/apugenomics/APU_Genomic_data/XHMM_test/TEST/Test_mydata_namechange/Output")

XHMM_calls<- fread("DATA_R.xcnv", data.table=FALSE, 
                stringsAsFactors=FALSE,sep="\t")


#To make an empty list to alocate memory for calls_1
lis_empty<- vector(mode = "list", length = nrow(XHMM_calls))
genename<-vector(mode = "list", length = nrow(XHMM_calls))

#creating a loop to for overlapping hits in GRanges for XHMM
for(i in 1:nrow(XHMM_calls)){
  XHMM_gr<- GRanges(XHMM_calls[i,2],
                       IRanges(XHMM_calls[i,3], XHMM_calls[i,4]))
  #Getting the names
  genename[[i]]<- names(annotations_gr[queryHits(findOverlaps(annotations_gr,
                                                              XHMM_gr)),])
  
  lis_empty[[i]]<- annotations_gr[queryHits(findOverlaps(annotations_gr,
                                                         XHMM_gr)),]
}

#unlisting all the names of the genes
genename_vec<- unlist(genename)

#Converting GRANges to the list
annotations_list<- GRangesList(lis_empty)

#Converting the list into a data.frame
annotations_df_XHMM<- data.frame(annotations_list)
annotations_df_XHMM$group_name<- genename_vec

#making an empty vector of length nrow(XHMM_calls)
names_change<- character(length = nrow(XHMM_calls))


#For each group extracting the names
for(i in 1:nrow(XHMM_calls)){
  #extracting the names column
  names_gene<- annotations_df_XHMM %>%
    filter(group == i) %>%
    pull(group_name)
  
  #storing it in a vecor
  names_change[i]<- paste(names_gene, collapse = "")
}

#Cbinding the name to the XHMM_calls df
annotations_df_XHMM_final<- cbind(XHMM_calls,names_change)

#Writing it to a file
write.table(annotations_df_XHMM_final, file="XHMM_annotated.txt", 
            sep="  ", quote=FALSE)


##----------------------------------------------------------------
#Doing the same for calls_1 and calls_2 for Conifer

#Changing the working directory
setwd("/media/apugenomics/APU_Genomic_data/Conifer_test/Output")

calls_1<- fread("calls_1.txt", data.table=FALSE, 
                stringsAsFactors=FALSE,sep="\t")

#To make an empty list to alocate memory for calls_1
lis_empty<- vector(mode = "list", length = nrow(calls_1))
genename<-vector(mode = "list", length = nrow(calls_1))

#creating a loop to for overlapping hits in GRanges for conifer
for(i in 1:nrow(calls_1)){
  calls_1_gr<- GRanges(calls_1[i,2],
                    IRanges(calls_1[i,3], calls_1[i,4]))
  #Getting the names
  genename[[i]]<- names(annotations_gr[queryHits(findOverlaps(annotations_gr,
                                                              calls_1_gr)),])
  
  lis_empty[[i]]<- annotations_gr[queryHits(findOverlaps(annotations_gr,
                                                         calls_1_gr)),]
}

#unlisting all the names of the genes
genename_vec<- unlist(genename)

#Converting GRANges to the list
annotations_list<- GRangesList(lis_empty)


#Converting the list into a data.frame
annotations_df_calls_1<- data.frame(annotations_list)
annotations_df_calls_1$group_name<- genename_vec

#making an empty vector of length nrow(calls_1)
names_change<- character(length = nrow(calls_1))


#For each group extracting the names
for(i in 1:nrow(calls_1)){
  #extracting the names column
  names_gene<- annotations_df_calls_1 %>%
    filter(group == i) %>%
    pull(group_name)
  
  #storing it in a vecor
  names_change[i]<- paste(names_gene, collapse = "")
}

#Cbinding the name to the calls_1 df
annotations_df_calls1_final<- cbind(calls_1,names_change)


#Writing it to a file
write.table(annotations_df_calls1_final, file="calls1_annotated.txt", 
            sep="  ", quote=FALSE)


##------------------------------------------------------------------
#Calls_2

#Changing the working directory
setwd("/media/apugenomics/APU_Genomic_data/Conifer_test/Output")

calls_2<- fread("calls_2.txt", data.table=FALSE, 
                stringsAsFactors=FALSE,sep="\t")

#To make an empty list to alocate memory for calls_2
lis_empty<- vector(mode = "list", length = nrow(calls_2))
genename<-vector(mode = "list", length = nrow(calls_2))


#creating a loop to for overlapping hits in GRanges for conifer
for(i in 1:nrow(calls_2)){
  calls_2_gr<- GRanges(calls_2[i,2],
                       IRanges(calls_2[i,3], calls_2[i,4]))
  #Getting the names
  genename[[i]]<- names(annotations_gr[queryHits(findOverlaps(annotations_gr,
                                                              calls_2_gr)),])
  
  lis_empty[[i]]<- annotations_gr[queryHits(findOverlaps(annotations_gr,
                                                         calls_2_gr)),]
}

#unlisting all the names of the genes
genename_vec<- unlist(genename)

#Converting GRANges to the list
annotations_list<- GRangesList(lis_empty)

#Converting the list into a data.frame
annotations_df_calls_2<- data.frame(annotations_list)
annotations_df_calls_2$group_name<- genename_vec

#making an empty vector of length nrow(calls_2)
names_change<- character(length = nrow(calls_2))


#For each group extracting the names
for(i in 1:nrow(calls_2)){
  #extracting the names column
  names_gene<- annotations_df_calls_2 %>%
    filter(group == i) %>%
    pull(group_name)
  
  #storing it in a vecor
  names_change[i]<- paste(names_gene, collapse = "")
}

#Cbinding the name to the calls_1 df
annotations_df_calls2_final<- cbind(calls_2,names_change)

#Writing it to a file
write.table(annotations_df_calls2_final, file="calls2_annotated.txt", 
            sep="  ", quote=FALSE)




