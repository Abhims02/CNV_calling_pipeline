#in the loop it is 1:number of samples present
#Drawback:Works only for this .txt file
#The .txt file is generated using the code present in the notes(add to notes)
#Changing the directory to where the file is
#In this case it is in the given directory
setwd("/media/apugenomics/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27")

#Reading the .txt file into R
file_read<- readLines("Chromosome_name.txt")

#Splitting the .txt file at tabs(/t)
names_vec<- unlist(strsplit(file_read, split = "\t", fixed = TRUE))

#loop to do it for all the files
for(i in 1:10){
  #command that needs to be run in terminal
  command<- paste0("cd /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output"," ; ","samtools view recal_reads_",i,".bam | ",
                   "sed 's/",names_vec[1],"/",names_vec[2],"/g' | ","sed 's/",names_vec[3],"/",names_vec[4],"/g' | ",
                   "sed 's/",names_vec[5],"/",names_vec[6],"/g' | ","sed 's/",names_vec[7],"/",names_vec[8],"/g' | ",
                   "sed 's/",names_vec[9],"/",names_vec[10],"/g' | ","sed 's/",names_vec[11],"/",names_vec[12],"/g' | ",
                   "sed 's/",names_vec[13],"/",names_vec[14],"/g' | ","sed 's/",names_vec[15],"/",names_vec[16],"/g' | ",
                   "sed 's/",names_vec[17],"/",names_vec[18],"/g' | ","sed 's/",names_vec[19],"/",names_vec[20],"/g' | ",
                   "sed 's/",names_vec[21],"/",names_vec[22],"/g' | ","sed 's/",names_vec[23],"/",names_vec[24],"/g' | ",
                   "sed 's/",names_vec[25],"/",names_vec[26],"/g' | ","sed 's/",names_vec[27],"/",names_vec[28],"/g' | ",
                   "sed 's/",names_vec[29],"/",names_vec[30],"/g' | ","sed 's/",names_vec[31],"/",names_vec[32],"/g' | ",
                   "sed 's/",names_vec[33],"/",names_vec[34],"/g' | ","sed 's/",names_vec[35],"/",names_vec[36],"/g' | ",
                   "sed 's/",names_vec[37],"/",names_vec[38],"/g' | ","sed 's/",names_vec[39],"/",names_vec[40],"/g' | ",
                   "sed 's/",names_vec[41],"/",names_vec[42],"/g' | ","sed 's/",names_vec[43],"/",names_vec[44],"/g' | ",
                   "sed 's/",names_vec[45],"/",names_vec[46],"/g' | ","sed 's/",names_vec[47],"/",names_vec[48],"/g' > recal_reads_alt",i,".sam",
                   " ; ","samtools view -bt ../../Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic_alt.fna.fai recal_reads_alt",i,".sam > recal_reads_alt",i,".bam",
                   " ; ","rm recal_reads_alt",i,".sam ; samtools index recal_reads_alt",i,".bam")
  
  print(command)
  
  #To execute the command on terminal
  system(command)
}


