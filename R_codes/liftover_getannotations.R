#loading packages data.table and GenomicRanges
library(data.table)
library(GenomicRanges)

#Reading the gtf file into R and accounting for only genes
gtf <- fread("GCF_009914755.1_T2T-CHM13v2.0_genomic.gtf", 
             data.table=FALSE, stringsAsFactors=FALSE,sep="\t")
gtf <- gtf[which(gtf[,3] == 'exon'),]

#Amending the table gtf 
gtf$V9 = gsub(";.*", "", gtf$V9)
gtf$V9 = gsub("gene_id ", "", gtf$V9)
gtf$chr = NA

#Reading the lifted file into R
lifted <- read.table("hglft_genome_10085_a37600.bed", stringsAsFactors=FALSE)

#Reading the names file into R
ids <- read.table("chromosomeids.txt", stringsAsFactors=FALSE)

#Renaming the columns to names matching the lifted
gtf <- merge(gtf, ids, by.x=1, by.y=1,sort=FALSE)
gtf[,1] = gtf$V2.y

#Using GRanges to create a new class of the data.frame
gtf_gr <- GRanges(gtf[,1], IRanges(gtf[,4], gtf[,5],names = gtf$V9 ))

#To make an empty list to alocate memory
lis_empty<- vector(mode = "list", length = nrow(lifted))
genename<-vector(mode = "list", length = nrow(lifted))

#A loop to find overlaps and hits in the GRanges
for(i in 1:nrow(lifted)){
  int1 <- GRanges(lifted[i,1], IRanges(lifted$V2[i], lifted$V3[i]))
  genename[[i]] <- names(gtf_gr[queryHits(findOverlaps(gtf_gr, int1)),])
  lis_empty[[i]] <- gtf_gr[queryHits(findOverlaps(gtf_gr, int1)),]
}

#Unlisting the genename list
genename_vec<- unlist(genename)

#To convert the class list to GRangeslist
GR_list<- GRangesList(lis_empty)

#To convert that to a data.frame
df_final<- data.frame(GR_list)

#Modifying the group_name column in the data.frame
df_final$group_name <- NA

#Adding the genename_vec to the df_final
df_final$group_name<- genename_vec

#Writing it out to a file
write.table(df_final, file="T2T_targetfile.txt", row.names=F, col.names=F, 
            sep=" ", quote=FALSE)

##Further the file is modified in the command line 
##Look at the file to see how it looks
