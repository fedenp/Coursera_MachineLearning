fin <- c()
for (i in (2:ncol(intrain1))) {
mis <- cleanNULL(intrain1[,i])
fin <- if (i==1) {fin <- mis} else if (mis==0) {fin} else {cbind(fin,mis)}  
}
fin