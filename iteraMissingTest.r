fin <- c()
for (i in (2:ncol(test1))) {
mis <- cleanNULL(test1[,i])
fin <- if (i==1) {fint <- mis} else if (mis==0) {fint} else {cbind(fint,mis)}  
}
fint