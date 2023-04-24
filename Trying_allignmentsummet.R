#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#Drawback:works only from home directory

#Assigning picard to a variable
picard<- "$PICARD"

#A loop for collecting alignment summary metrics
for(i in 9:10){
  #command that needs to be run in the command line
  command<-paste0("java -jar ",picard," CollectAlignmentSummaryMetrics -R /media/apf/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz ",
                  "-I /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/sorted_dedup_reads_",i,".bam ","-O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,
                  "/Analysis/alignment_metrics.txt"," ; ","samtools depth -a /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/sorted_dedup_reads_",i,".bam ",
                  "> /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/depth_output.txt")
  
  print(command)
  
  #to execute the command in terminal
  #system(command)
}
