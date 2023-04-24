#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop extrat baserecali table
#Drawback: open R from home directory only
for(i in 1:10){
  #A command to create a recali table
  command<- paste0("cd /media/apugenomics/APU_Genomic_data/Tools/gatk-4.2.6.1"," ; ","./gatk BaseRecalibrator -R /media/apugenomics/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -I /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Output/sorted_dedup_reads_",i,".bam --known-sites /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_8_excludefltd/bqsr_snps.vcf --known-sites /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_8_excludefltd/bqsr_indels.vcf -O /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_9_Bqsr_table/recal_data.table")
  
  print(command)
  
  #To run the command on the terminal
  system(command)
}