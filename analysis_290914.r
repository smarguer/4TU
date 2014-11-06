S1=read.delim("1_S1_L001_R2_001.map",stringsAsFactors=F,header=F,skip=1)
S2=read.delim("2_S2_L001_R2_001.map",stringsAsFactors=F,header=F,skip=1)
colnames(S1)=c("gene","A->A","A->T","A->C","A->G","T->A","T->T","T->C","T->G","C->A","C->T","C->C","C->G","G->A","G->T","G->C","G->G","reads","mut")
colnames(S2)=c("gene","A->A","A->T","A->C","A->G","T->A","T->T","T->C","T->G","C->A","C->T","C->C","C->G","G->A","G->T","G->C","G->G","reads","mut")
par(mfrow=c(4,4))
for(i in 2:17)
 {
 plot(density(S1[,i]),main=colnames(S1)[i],xlim=c(0,100))
 lines(density(S2[,i]),col="red")
 }


