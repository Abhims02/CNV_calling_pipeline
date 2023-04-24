#In the loop the input is from 1:number of files
#The files are present in the directors as shown(put a diagram)
#A loop for generating raw snps and indels from raw vcfs
#Drawback: open R from home directory only
for(i in 1){
  #The command to extract snps and indels
  command<- paste0("cd /media/apugenomics/APU_Genomic_data/Tools/gatk-4.2.6.1/"," ; ","./gatk SelectVariants -R /media/apugenomics/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -V /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_12_Analyze_covariants/raw_variants_recal.vcf -select-type SNP -O /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_13_snp_indl/raw_snps_recal.vcf ; ./gatk SelectVariants -R /media/apugenomics/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna -V /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",
                   i,"/Analysis/Step_12_Analyze_covariants/raw_variants_recal.vcf -select-type INDEL -O /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/Step_13_snp_indl/raw_indels_recal.vcf")
  
  print(command)
  
  #To run the command on terminal
  system(command)
}