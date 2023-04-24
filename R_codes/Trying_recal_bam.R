#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop generate recalibrated bam files
#Drawback: open R from home directory only
for(i in 6){
  #A command to generate recalibrated bam files
  command<- paste0("cd Desktop/Tools/gatk-4.2.6.1/"," ; ","./gatk ApplyBQSR -R /media/apf/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -I /media/apf/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Output/sorted_dedup_reads_",i,".bam -bqsr /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/recal_data.table -O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Output/recal_reads_",i,".bam")
  
  print(command)
  
  #To run the command on terminal
  system(command)
}