out <- c()
for (i in (2:ncol(test))) {
res <- cleanNA(test[,i])
outt <- if (i==1) {outt <- res} else if (res==0) {outt} else {cbind(outt,res)}  
}
outt
