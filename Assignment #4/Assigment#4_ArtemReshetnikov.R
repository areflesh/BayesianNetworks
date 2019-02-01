library(bnlearn)
# Building the BN structure (DAG)
names <- c("X", "Y", "Z")
net <- empty.graph(names)
#Define arrows of the DAG:
Matrix <- matrix(c(0,0,1,0,0,1,0,0,0),
                    nrow = 3,
                    byrow = TRUE,
                    dimnames=list(nodes(net), nodes(net)))

amat(net) = Matrix
graphviz.plot(net)
#Load and prepare data
load("datos_generados_ejercicio_7.rdata")  
data <- datos_generados_ejercicio_7
data <- na.omit(data)
data[] <- lapply(data, as.factor)
#Use MLE method
net.estimated = bn.fit(net, data, method = "mle")
#Save cofficients
cof <- coefficients(net.estimated)
#Marginal of X
cof$X
#Marginal of Y  
cof$Y
# P(Z| Y = 0,X )
cof$Z[,,1]
# P(Z| Y = 1,X )
cof$Z[,,2] 
#Estim of the parameters:
theta_11<-cof$X[[2]]
theta_21<-cof$Y[[2]]
theta_31<-cof$Z[2,2,2]  #P(Z=1|X=1,Y=1)
theta_32<-cof$Z[2,1,2]  #P(Z=1|X=0,Y=1)
theta_33<-cof$Z[2,2,1]  #P(Z=1|X=1,Y=0)
theta_34<-cof$Z[2,1,1]  #P(Z=1|X=0,Y=0)
par <- matrix(c(theta_11, theta_21, theta_31, theta_32, theta_33, theta_34),nrow=1)  
colnames(par) <- c("theta11", "theta21", "theta31","theta32","theta33","theta34")
par  



