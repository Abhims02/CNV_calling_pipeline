#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop for generating raw variants
#Open R only from home directory
for(i in 3:10){
  #The command to call for variants
  command<- paste0("cd Desktop/Tools/gatk-4.2.6.1/"," ; ","./gatk HaplotypeCaller -R /media/apf/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -I /media/apf/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Output/sorted_dedup_reads_",i,".bam ","-O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/raw_variants.vcf")
  
  print(command)
  
  #To execute the command on terminal
  system(command)
}