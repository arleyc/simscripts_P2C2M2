genes<-c("mtDNA","PNN","A12D","PRLR","KIF24","DNAH3","DMXL","CMOS","MXRA5","EXPH5",
			"SNCAIP","A1D","A4B","A9C")

for (i in 1:14) {
mygene<-read.csv(file=paste(genes[i],".phy",sep=""),sep=" ")

cat(paste("<data id=\"",genes[i],"\" spec=\"Alignment\" name=\"alignment\">", sep=""))

	for (j in 1:dim(mygene)[1]) {
		cat(paste("\n","<sequence id=\"",genes[i],"_",mygene[j,1],"\" spec=\"Sequence\" taxon=\"",
			mygene[j,1],"\" totalcount=\"4\" value=\"",mygene[j,2],"\"/>", sep=""))
	}

cat(paste("\n","</data>", "\n", sep=""))

}