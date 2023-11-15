# What is the mean of a chi squared random variable with 5 degrees of freedom
# One approach is to do it analytically
# The other way to estimate it via Monte Carlo

set.seed(1)
n<-10^5
samp <- rchisq(n,df=5)
mean(samp)
var(samp)
