

#grep -c ACGTCAAAAACCAAATCTGAATT 1_S1_L001_R1_001.fastq
#grep -c ACGTCGAAAACCAAATCTGAATT 1_S1_L001_R1_001.fastq
#grep -c ACGTCAGAAACCAAATCTGAATT 1_S1_L001_R1_001.fastq
#grep -c ACGTCAAGAACCAAATCTGAATT 1_S1_L001_R1_001.fastq
#grep -c ACGTCAAAGACCAAATCTGAATT 1_S1_L001_R1_001.fastq
#grep -c ACGTCAAAAGCCAAATCTGAATT 1_S1_L001_R1_001.fastq
#
#grep -c ACGTCAAAAACCAAATCTGAATT 2_S2_L001_R1_001.fastq
#grep -c ACGTCGAAAACCAAATCTGAATT 2_S2_L001_R1_001.fastq
#grep -c ACGTCAGAAACCAAATCTGAATT 2_S2_L001_R1_001.fastq
#grep -c ACGTCAAGAACCAAATCTGAATT 2_S2_L001_R1_001.fastq
#grep -c ACGTCAAAGACCAAATCTGAATT 2_S2_L001_R1_001.fastq
#grep -c ACGTCAAAAGCCAAATCTGAATT 2_S2_L001_R1_001.fastq
#
#grep -c GTAGAACATAAAAGAACAAAAATGGA 1_S1_L001_R1_001.fastq 
#grep -c GTAGAACATGAAAGAACAAAAATGGA 1_S1_L001_R1_001.fastq 
#grep -c GTAGAACATAGAAGAACAAAAATGGA 1_S1_L001_R1_001.fastq 
#grep -c GTAGAACATAAGAGAACAAAAATGGA 1_S1_L001_R1_001.fastq 
#grep -c GTAGAACATAAAGGAACAAAAATGGA 1_S1_L001_R1_001.fastq 
#
#grep -c GTAGAACATAAAAGAACAAAAATGGA 2_S2_L001_R1_001.fastq 
#grep -c GTAGAACATGAAAGAACAAAAATGGA 2_S2_L001_R1_001.fastq 
#grep -c GTAGAACATAGAAGAACAAAAATGGA 2_S2_L001_R1_001.fastq 
#grep -c GTAGAACATAAGAGAACAAAAATGGA 2_S2_L001_R1_001.fastq 
#grep -c GTAGAACATAAAGGAACAAAAATGGA 2_S2_L001_R1_001.fastq 
#
#GACATCCGAA TTTATTATGG
#grep -c CCATAATAAATTCGGACGTC S2_L001_R1_001.fastq
#
#AGAAGAAAAATATGAGACTG
#CAGTCTCATATTTTTCTTCT

#bwa aln ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa 2_S2_L001_R1_001.fastq > 2_S2_L001_R1_001.sai
#bwa samse ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa 2_S2_L001_R1_001.sai 2_S2_L001_R1_001.fastq > 2_S2_L001_R1_001.sam
#bwa aln ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa 1_S1_L001_R1_001.fastq > 1_S1_L001_R1_001.sai
#bwa samse ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa 1_S1_L001_R1_001.sai 1_S1_L001_R1_001.fastq > 1_S1_L001_R1_001.sam


##create fai file
#samtools faidx ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa
#
#samtools view -b -S -o 1_S1_L001_R1_001.bam 1_S1_L001_R1_001.sam
#samtools sort 1_S1_L001_R1_001.bam 1_S1_L001_R1_001.sorted
#samtools index 1_S1_L001_R1_001.sorted.bam
#samtools mpileup -u -f ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa 1_S1_L001_R1_001.sorted.bam > 1_S1_L001_R1_001.bcf
#bcftools view -v -c -g 1_S1_L001_R1_001.bcf > 1_S1_L001_R1_001.vcf

samtools view -b -S -o 2_S2_L001_R1_001.bam 2_S2_L001_R1_001.sam
samtools sort 2_S2_L001_R1_001.bam 2_S2_L001_R1_001.sorted
samtools index 2_S2_L001_R1_001.sorted.bam
samtools mpileup -u -f ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fsa 2_S2_L001_R1_001.sorted.bam > 2_S2_L001_R1_001.bcf
bcftools view -v -c -g 2_S2_L001_R1_001.bcf > 2_S2_L001_R1_001.vcf

##R###
out1=data.frame()
out1[1,1]=length(which(test1[,"REF"]=="A"))
out1[2,1]=length(which(test1[,"REF"]=="T"))
out1[3,1]=length(which(test1[,"REF"]=="C"))
out1[4,1]=length(which(test1[,"REF"]=="G"))
out1[1,2]=length(which(test1[,"ALT"]=="A"))
out1[1,2]=length(which(test1[,"ALT"]=="T"))
out1[3,2]=length(which(test1[,"ALT"]=="C"))
out1[4,2]=length(which(test1[,"ALT"]=="G"))
out1[1,3]=length(which((test1[,"REF"]=="A")&(test1[,"ALT"]=="A")))
out1[1,4]=length(which((test1[,"REF"]=="A")&(test1[,"ALT"]=="T")))
out1[1,5]=length(which((test1[,"REF"]=="A")&(test1[,"ALT"]=="C")))
out1[1,6]=length(which((test1[,"REF"]=="A")&(test1[,"ALT"]=="G")))
out1[2,3]=length(which((test1[,"REF"]=="T")&(test1[,"ALT"]=="A")))
out1[2,4]=length(which((test1[,"REF"]=="T")&(test1[,"ALT"]=="T")))
out1[2,5]=length(which((test1[,"REF"]=="T")&(test1[,"ALT"]=="C")))
out1[2,6]=length(which((test1[,"REF"]=="T")&(test1[,"ALT"]=="G")))
out1[3,3]=length(which((test1[,"REF"]=="C")&(test1[,"ALT"]=="A")))
out1[3,4]=length(which((test1[,"REF"]=="C")&(test1[,"ALT"]=="T")))
out1[3,5]=length(which((test1[,"REF"]=="C")&(test1[,"ALT"]=="C")))
out1[3,6]=length(which((test1[,"REF"]=="C")&(test1[,"ALT"]=="G")))
out1[4,3]=length(which((test1[,"REF"]=="G")&(test1[,"ALT"]=="A")))
out1[4,4]=length(which((test1[,"REF"]=="G")&(test1[,"ALT"]=="T")))
out1[4,5]=length(which((test1[,"REF"]=="G")&(test1[,"ALT"]=="C")))
out1[4,6]=length(which((test1[,"REF"]=="G")&(test1[,"ALT"]=="G")))

row.names(out1)=c("A","T","C","G")
colnames(out1)=c("REF","ALT","A","T","C","G")


out2=data.frame()
out2[1,1]=length(which(test2[,"REF"]=="A"))
out2[2,1]=length(which(test2[,"REF"]=="T"))
out2[3,1]=length(which(test2[,"REF"]=="C"))
out2[4,1]=length(which(test2[,"REF"]=="G"))
out2[1,2]=length(which(test2[,"ALT"]=="A"))
out2[2,2]=length(which(test2[,"ALT"]=="T"))
out2[3,2]=length(which(test2[,"ALT"]=="C"))
out2[4,2]=length(which(test2[,"ALT"]=="G"))
out2[1,3]=length(which((test2[,"REF"]=="A")&(test2[,"ALT"]=="A")))
out2[1,4]=length(which((test2[,"REF"]=="A")&(test2[,"ALT"]=="T")))
out2[1,5]=length(which((test2[,"REF"]=="A")&(test2[,"ALT"]=="C")))
out2[1,6]=length(which((test2[,"REF"]=="A")&(test2[,"ALT"]=="G")))
out2[2,3]=length(which((test2[,"REF"]=="T")&(test2[,"ALT"]=="A")))
out2[2,4]=length(which((test2[,"REF"]=="T")&(test2[,"ALT"]=="T")))
out2[2,5]=length(which((test2[,"REF"]=="T")&(test2[,"ALT"]=="C")))
out2[2,6]=length(which((test2[,"REF"]=="T")&(test2[,"ALT"]=="G")))
out2[3,3]=length(which((test2[,"REF"]=="C")&(test2[,"ALT"]=="A")))
out2[3,4]=length(which((test2[,"REF"]=="C")&(test2[,"ALT"]=="T")))
out2[3,5]=length(which((test2[,"REF"]=="C")&(test2[,"ALT"]=="C")))
out2[3,6]=length(which((test2[,"REF"]=="C")&(test2[,"ALT"]=="G")))
out2[4,3]=length(which((test2[,"REF"]=="G")&(test2[,"ALT"]=="A")))
out2[4,4]=length(which((test2[,"REF"]=="G")&(test2[,"ALT"]=="T")))
out2[4,5]=length(which((test2[,"REF"]=="G")&(test2[,"ALT"]=="C")))
out2[4,6]=length(which((test2[,"REF"]=="G")&(test2[,"ALT"]=="G")))

row.names(out2)=c("A","T","C","G")
colnames(out2)=c("REF","ALT","A","T","C","G")











