#In the loop the input is from 1:number of files
#To generate RPKM files from sample probes_test.txt file 
#The files are present in the directors as shown(put a diagram)
#If there is no RPKM_dir make one and then proceed
#a loop to run RPKM generating
for(i in 1:10){
  #Changing the directory to where the probes file and the RPKM_dir is located
  change_dir<- "cd /media/apugenomics/APU_Genomic_data/Conifer_test/Input"
  
  #For the main command
  command<- paste0(change_dir," ; python3 ../../Tools/Variantcalltools/conifer_APU/scripts/conifer_python3-master/conifer.py rpkm --probes T2T_probesfinal.txt --input ../../Sample_NDD/Sample_",
                   i,"/Output/recal_reads_alt",i,".bam --output RPKM_T2T_dir/sample_",i,".rpkm.txt")
  
  print(command)
  
  #To run the command on terminal
  system(command)
}

