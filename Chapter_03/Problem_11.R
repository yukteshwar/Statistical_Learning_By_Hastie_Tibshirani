# Clear workspace
rm(list = ls())
# Clear all plots
graphics.off()
# Clear Console
cat("\f")

# run this if it's your first time using it to install
# install.packages("rstudioapi")

# Make sure that you have the directory set to the correct location for the data.
library(rstudioapi) # load it
# The following line is for getting the path of your current open file
current_path <- getActiveDocumentContext()$path 
# The next line set the working directory to the relevant one:
setwd(dirname(current_path ))
# You can make sure you are in the right directory
print( getwd() )

# To begin, we generate a predictor x and a response y as follows.
set.seed(1)
x = rnorm(100)
y = 2 * x + rnorm(100)

# Perform a simple linear regression of y onto x , without an intercept. 
# Report the coefficient estimate, the standard error of this coefficient 
# estimate, and the t-statistic and p-value associated with the null hypothesis.
# Comment on these results. (You can perform regression without an intercept 
# using the command lm(y∼x+0) .)
lm.fit.yonx = lm(y~x+0)
print(lm.fit.yonx$coefficients)
print(summary(lm.fit.yonx)$coefficients[,2])
print(summary(lm.fit.yonx)$coefficients[,3])
print(summary(lm.fit.yonx)$coefficients[,4])

# Now perform a simple linear regression of x onto y without an intercept, 
# and report the coefficient estimate, its standard error, and the 
# corresponding t-statistic and p-values associated with the null hypothesis.
# Comment on these results.
lm.fit.xony = lm(x~y+0)
print(lm.fit.xony$coefficients)
print(summary(lm.fit.xony)$coefficients[,2])
print(summary(lm.fit.xony)$coefficients[,3])
print(summary(lm.fit.xony)$coefficients[,4])

# What is the relationship between the results obtained in (a) and (b)?
print ("No relation! t-statistics is same")

# Show that when regression is performed with an intercept the t-statistic
# is the same for the regression of y onto x as it is for the regression of x onto y .
print(summary(lm(y~x)))
print(summary(lm(x~y)))