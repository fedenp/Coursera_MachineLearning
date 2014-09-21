cleanNULL <- function(x) {
a <- which(x=="")
pct <- length(a)/length(x)
r <- if (pct > 0.25) {-i} else {0}
return(r)
}
