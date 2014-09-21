out <- c()
for (i in (2:ncol(intrain))) {
res <- cleanNA(intrain[,i])
out <- if (i==1) {out <- res} else if (res==0) {out} else {cbind(out,res)}  
}
out
