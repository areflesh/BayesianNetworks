library(gRain)
tf <- c("false","true")
node.T<- cptable(~ T, values=c(8,2),levels=tf)
node.B<- cptable(~ B, values=c(1,9), levels=tf)
node.S1<- cptable(~ S1 + T + B, values=c(1,0,1,0,99,1,3,97), levels=tf)
node.S2<- cptable(~ S2 + T + B, values=c(1,0,1,0,99,1,3,97), levels=tf)
nodes <- list(node.T,node.B,node.S1,node.S2)
plist <- compileCPT(nodes)
net<-grain(plist)
nettaska<-setEvidence(net,nodes=c("S1","S2"),states=c("false", "false"))
a=querygrain(nettaska,nodes=c("T"), type="marginal")
a
a$T["true"]
nettaskb<-setEvidence(net,nodes=c("S1","S2"),states=c("true", "true"))
b=querygrain(nettaskb,nodes=c("T"), type="marginal")
b
b$T["true"]
nettaskc<-setEvidence(net,nodes=c("S1","S2"),states=c("true", "false"))
c=querygrain(nettaskc,nodes=c("T"), type="marginal")
c
c$T["true"]    