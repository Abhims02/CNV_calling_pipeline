# CNV_calling_pipeline
This was the pipeline used for my honours project. A CNV calling pipeline using Conifer and XHMM. 


##Recaibrated BAM files
For prepping the bam files we used the Variant calling pipeline using gatk4 by (Mohammed Khalfan, 2020)
link: https://gencore.bio.nyu.edu/variant-calling-pipeline-gatk4/ 
Download gatk4 from the official site: https://github.com/broadinstitute/gatk/releases
For codes refer: Recalibrated_bams_code



##Conifer
For CNV calling using Conifer we used the official pipeline by (Kurmm et.al.,2012) 
link: https://conifer.sourceforge.net/tutorial.html
Download Conifer from official site: https://conifer.sourceforge.net/download.html
The python files are for python v2.7 or lower
For using python3 download Conifer python scripts from: https://github.com/shwetaramdas/conifer_python3
For codes refer: Conifer_code


##XHMM
For CNV calling using XHMM we used the official pipeline by (Fromer and Purcell, 2014)
link: https://zzz.bwh.harvard.edu/xhmm/tutorial.shtml 
Download XHMM from offical site: https://zzz.bwh.harvard.edu/xhmm/download.shtml
For codes refer: XHMM_code


##Samplot
For visualization of calls we used Samplot by (Belyeu, et.al., 2021)
link for downloading and tutorial: https://github.com/ryanlayer/samplot
Download biocond to run samplot: http://www.ddocent.com//bioconda/ 
For codes refer: samplot_codes

##R_codes
All the steps in the pipeline have been automated for all the samples using R and the codes for each step is uploaded in the R_codes folder.

##Honours_analysis
This folder contains all the analysis done in the project. Along with the csv data files on which analysis was done and R-script written for analysis
