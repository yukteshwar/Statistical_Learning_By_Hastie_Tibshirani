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

# To begin, load in the Boston data set. The Boston data set is part of the MASS library in R
library(MASS)
#attach(Boston)

# For each predictor, fit a simple linear regression model to predict
# the response. Describe your results. In which of the models is
# there a statistically significant association between the predictor
# and the response? Create some plots to back up your assertions.
lm.fit = lm(crim~zn, data = Boston)
plot(zn, crim)
abline(lm.fit, lwd = 3, col = "red")

# lm.fit = lm(crim~indus)
# plot(indus, crim)
# abline(lm.fit, lwd = 3, col = "red")
# 
# lm.fit = lm(crim~chas)
# plot(chas, crim)
# abline(lm.fit, lwd = 3, col = "red")
# 
# lm.fit = lm(crim~nox)
# plot(nox, crim)
# abline(lm.fit, lwd = 3, col = "red")
# 
# lm.fit = lm(crim~rm)
# plot(rm, crim)
# abline(lm.fit, lwd = 3, col = "red")
# 
# lm.fit = lm(crim~age)
# plot(age, crim)
# abline(lm.fit, lwd = 3, col = "red")

# Skipping rest of them

# Fit a multiple regression model to predict the response using
# all of the predictors. Describe your results. For which predictors
# can we reject the null hypothesis H0: beta_j = 0
lm.fitall = lm(crim~., data = Boston)
print(summary(lm.fitall))
print("Based on p-values, we reject the null hypothesis H0: beta_j = 0 for all variables except dis, rad & medv")

# How do your results from (a) compare to your results from (b)?
# Create a plot displaying the univariate regression coefficients
# from (a) on the x-axis, and the multiple regression coefficients
# from (b) on the y-axis
individual.coeffs = list()
#nPred = length(sapply(Boston, class)) - 1
predictors = colnames(Boston)
nPred = length(predictors)
for(i in 2:length(predictors))
{
  lm.fit = lm(crim~Boston[,i], data = Boston)
  individual.coeffs = c(individual.coeffs, lm.fit$coefficients[2])
}


plot(individual.coeffs, lm.fitall$coefficients[2:nPred])
        