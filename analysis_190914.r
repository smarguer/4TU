
HL_S1=vector()
HL_S2=vector()

for (i in 1:nrow(S1a))
{
 if(S1a[i,1] %in% HL[,1])
 {
  HL_S1[i]=HL[which(HL[,1]==S1a[i,1]),3] 
 }
 else
 {
  HL_S1[i]=NA
 } 
}
for (i in 1:nrow(S2a))
{
 if(S2a[i,1] %in% HL[,1])
 {
  HL_S2[i]=HL[which(HL[,1]==S2a[i,1]),3] 
 }
 else
 {
  HL_S2[i]=NA
 } 
}




