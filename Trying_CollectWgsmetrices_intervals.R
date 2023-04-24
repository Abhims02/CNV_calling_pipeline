##This is a loop to run GetWgsmetrics 
for(i in c(1,2,4,5,6,7,8,9,10)){
  command<- paste0("java -jar /media/apugenomics/APU_Genomic_data/Tools/picard-2.27.4/picard.jar CollectWgsMetrics -I /media/apugenomics/APU_Genomic_data/XHMM_test/TEST/Test_mydata_namechange/recal_reads_alt",
                   i,"_rg.bam -O /media/apugenomics/APU_Genomic_data/Sample_NDD/Sample_",i,"/Analysis/collect_wgs_metrices_",i,
                   ".txt -R /media/apugenomics/APU_Genomic_data/Sample_NDD/Input/ncbi-genomes-2022-06-27/GCF_009914755.1_T2T-CHM13v2.0_Genomic.fna --INTERVALS /media/apugenomics/APU_Genomic_data/Conifer_test/Input/list.interval_list")
  
  print(command)
  
  system(command)
}