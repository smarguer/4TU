
#map.snp1=vector()
#for(i in 1:nrow(test1))
#{
#print(i)
#map.snp1[i]=NA
# if (length(gff[which((gff[,1]==test1[i,1])&(gff[,"start"] < test1[i,2]) &(gff[,"end"] > test1[i,2])),10][1])!=0)
# {
#  map.snp1[i]=gff[which((gff[,1]==test1[i,1])&(gff[,"start"] < test1[i,2]) &(gff[,"end"] > test1[i,2])),10][1]
# }
#}


#map.snp2=vector()
#for(i in 1:nrow(test2))
#{
#print(i)
#map.snp2[i]=NA
# if (length(gff[which((gff[,1]==test2[i,1])&(gff[,"start"] < test2[i,2]) &(gff[,"end"] > test2[i,2])),10][1])!=0)
# {
#  map.snp2[i]=gff[which((gff[,1]==test2[i,1])&(gff[,"start"] < test2[i,2]) &(gff[,"end"] > test2[i,2])),10][1]
# }
#}

map1=unique(map.snp1)
map2=unique(map.snp2)
map1=map1[which(is.na(map1)==F)]
map2=map2[which(is.na(map2)==F)]

n1=data.frame()
for(i in 1:length(map1))
{
 n1[i,1]=map1[i]
 n1[i,2]=length(which(map.snp1==map1[i]))
}
n2=data.frame()
for(i in 1:length(map2))
{
 n2[i,1]=map2[i]
 n2[i,2]=length(which(map.snp2==map2[i]))
}

