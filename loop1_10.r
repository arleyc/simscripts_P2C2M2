library(P2C2M2)

for (i in 1:10) {

	result<-p2c2m2.complete(path=paste("./newsim",i,sep=""), xml.file=paste("sim",i,".xml",
		sep=""), num.reps=10)
	print(result)
}
