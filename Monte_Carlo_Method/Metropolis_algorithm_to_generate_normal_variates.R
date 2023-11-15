# f is proportional to target distribution
f <- function(x){exp(-0.5*((x-15)/3)^2)}

# Our proposal function centered at the current value
propose <- function(current){
  runif(1,min=current-50,max=current+50)
}

n<-5000
set.seed(1)
x <- c(15,rep(NA,n-1)) #start at 100
for (t in 1:(n-1)){
  current <- x[t]
  proposed <- propose(current) 
  pmove <- f(proposed)/f(current)
  u <- runif(1)
  if (u <=pmove){
    x[t+1]<-proposed
  } else{
    x[t+1]<-current
  }
}

plot(x,type="l")

x_keep <- x[-c(1:180)]
hist(x_keep, breaks = 30, freq = F,axes=F)
axis(1, at = seq(4,26,by=2))
s<-seq(from = 4, to = 26, by = 0.01)
lines(s,dnorm(s,15,3),col = "red")

plot(s, pnorm(s,15,3),col = "red",type="l",lwd = 3)
plot(ecdf(x_keep),add=T,type="l",lwd=3)


#compare it to a random draw from a normal distribution

x_iid <- rnorm(1000,mean = 15, sd = 3)
plot(x_iid, type = "l")
hist(x_iid,breaks = 30, freq =F)
