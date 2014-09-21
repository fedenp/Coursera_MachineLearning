cleanNA <- function(x) {
a <- is.na(x)
pct <- length(a[a==TRUE])/length(a)
r <- if (pct > 0.25) {-i} else {0}
return(r)
}


