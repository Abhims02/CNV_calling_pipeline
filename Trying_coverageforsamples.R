##This is to get coverage data for all the samples
##A loop is made

for(i in 1:10){
  command<- paste0("samtools coverage /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
         i,"/Output/recal_reads_alt",i,".bam -o ~/Desktop/coverage_data/sample_",i,".coverage")
  
  print(command)
  
  system(command)
}