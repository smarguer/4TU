


test1=read.delim("1_S1_L001_R1_001.map",row.names=1,skip=1,stringsAsFactors=F,header=F)
test2=read.delim("2_S2_L001_R1_001.map",row.names=1,skip=1,stringsAsFactors=F,header=F)
colnames(test1)=c("A->A","A->T","A->C","A->G","T->A","T->T","T->C","T->G","C->A","C->T","C->C","C->G","G->A","G->T","G->C","G->G")
colnames(test2)=c("A->A","A->T","A->C","A->G","T->A","T->T","T->C","T->G","C->A","C->T","C->C","C->G","G->A","G->T","G->C","G->G")

le1=vector()
le2=vector()
 
#for(i in 1:nrow(test1))
#{
# print(i)
# hit=strsplit(row.names(test1)[i][1],'\\.E\\d')
# print(hit)
# if(length(hit[[1]]) > 1)
# {
#  hit=hit[[1]][which(grepl("AS\\.",hit[[1]])==F)]
# }
# print(hit)
# hit=hit[1]
# if(hit %in% BIG[,1])
# {
#  le1[i]=BIG[which(BIG[,1]==hit),"len_ex"]
# }
# else
# {
#  le1[i]=NA
# }
#}

#for(i in 1:nrow(test2))
#{
# print(i)
# hit=strsplit(row.names(test2)[i][1],'\\.E\\d')
# print(hit)
# if(length(hit[[1]]) > 1)
# {
#  hit=hit[[1]][which(grepl("AS\\.",hit[[1]])==F)]
# }
# print(hit)
# hit=hit[1]
# if(hit %in% BIG[,1])
# {
#  le2[i]=BIG[which(BIG[,1]==hit),"len_ex"]
# }
# else
# {
#  le2[i]=NA
# }
#}

####1_##########
Format.4TU=function(dat=test1,ref=BIG)
{
names1=vector()

n=dat[1,]
n[which(n!=0)]=0

for(i in 1:nrow(dat))
{
 #print(i)
 hit=strsplit(row.names(dat)[i][1],'\\.[IE]\\d+\\s*')
 #print(hit)
 if(length(hit[[1]]) > 1)
 {
  hit1=hit[[1]][which((grepl("AS\\.",hit[[1]])==F)&(grepl("INTRON",hit[[1]])==F))]
  if(length(hit1)==0)
  {
   hit1=hit[[1]][1]
  }
  hit=hit1
 }
# print(hit)
 
 hit=hit[[1]]
 names1[i]=hit
 #print(names1[i])
}
test1f=cbind(names1,dat,stringsAsFactors=F)
AS=grep("AS",names1)
IN=grep("INTRON",names1)
test1f=test1f[-c(AS,IN),]
names1f=unique(test1f[,1])

test1ff=rep(0,16)
names(test1ff)=colnames(test1f)[2:17]

for (i in 1:length(names1f))
{
 print(i)
 f=colSums(test1f[which(test1f[,1]==names1f[i]),2:17])
 test1ff=rbind(test1ff,f)
}
test1ff=test1ff[2:nrow(test1ff),]
row.names(test1ff)=names1f
test1ff=data.frame(test1ff)
colnames(test1ff)=colnames(dat)

OUT1=rep(0,52)
names(OUT1)=c(colnames(ref),colnames(test1ff))


for (i in 1:nrow(ref))
{
 print(i)

 if(ref[i,1] %in% names1f)
 {
  OUT1=rbind(OUT1,cbind(ref[i,],test1ff[which(names1f==ref[i,1]),]))
 }
 else
 {
  OUT1=rbind(OUT1,cbind(ref[i,],n))
 }
}
OUT1=OUT1[2:nrow(OUT1),]
OUT1=as.data.frame(OUT1,stringsAsFactors=F)
return(OUT1)
}





lim=c(1,100000)
par(mfrow=c(2,6))
plot(OUT1[,"A->T"],OUT2[,"A->T"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"A->C"],OUT2[,"A->C"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"A->G"],OUT2[,"A->G"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"T->A"],OUT2[,"T->A"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"T->C"],OUT2[,"T->C"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"T->G"],OUT2[,"T->G"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"C->A"],OUT2[,"C->A"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"C->T"],OUT2[,"C->T"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"C->G"],OUT2[,"C->G"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"G->A"],OUT2[,"G->A"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"G->T"],OUT2[,"G->T"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)
plot(OUT1[,"G->C"],OUT2[,"G->C"],log="xy",xlim=lim,ylim=lim)
abline(0,1,col="red",lwd=3)


