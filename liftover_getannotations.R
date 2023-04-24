library(data.table)
library(GenomicRanges)

gtf = fread("zcat GCF_009914755.1_T2T-CHM13v2.0_genomic.gtf.gz | grep -v '#'", data.table=FALSE, stringsAsFactors=F,sep="\t")
gtf = gtf[which(gtf[,3] == 'gene'),]

gtf$V9 = gsub(";.*", "", gtf$V9)
gtf$V9 = gsub("gene_id ", "", gtf$V9)
gtf$chr = NA

lifted = read.table("hglft_genome_2a3a9_a19010.bed", stringsAsFactors=F)

ids = read.table("chromosomeids.txt", stringsAsFactors=F)
gtf = merge(gtf, ids, by.x=1, by.y=1,sort=F)
gtf[,1] = gtf$V2.y
gtf_gr = GRanges(gtf[,1], IRanges(gtf[,4], gtf[,5],names = gtf$V9 ))

lifted$genes = NA
for(i in 1:nrow(lifted)){
	int1 = GRanges(lifted[i,1], IRanges(lifted$V2[i], lifted$V3[i]))
	genename = names(gtf_gr[queryHits(findOverlaps(gtf_gr, int1)),])
	lifted$genes[i] = paste(genename, collapse=",")
}

write.table(lifted, file="T2T_targetfile.txt", row.names=F, col.names=F, sep="\t", quote=FALSE)

