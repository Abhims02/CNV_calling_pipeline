#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop for generating raw snps and indels from raw vcfs
#Drawback: open R from home directory only
for(i in 1:10){
  #The command to extract snps and indels
  command<- paste0("cd Desktop/Tools/gatk-4.2.6.1/"," ; ","./gatk SelectVariants -R /media/apf/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -V /media/apf/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_4_rawvariants/raw_variants.vcf -select-type SNP -O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_5_rawsnps_indls/raw_snps.vcf ; ./gatk SelectVariants -R /media/apf/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -V /media/apf/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_4_rawvariants/raw_variants.vcf -select-type INDEL -O /media/apf/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_5_rawsnps_indls/raw_indels.vcf")
  
  print(command)
  
  #To run the command on terminal
  system(command)
}