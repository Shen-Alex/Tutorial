
# For a posterior gamma distribution with the parameters as following
shape <- 5
rate <- 1.5
bounds <- qgamma(c(.025,.975),shape, rate)
bounds

# Equal tail credibility interval

# Equal tail credibility interval -----------------------------------------
library(mosaic)
xpgamma(bounds,shape,rate)


# Highest posterior density interval --------------------------------------
library(HDInterval)
shape <- 5
rate <-1.5
bounds <- hdi(qgamma,credMass = 0.95, shape=shape, rate=rate)
bounds
xpgamma(bounds,shape,rate)
