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

library(ISLR)
# Fit a multiple regression model to predict Sales using Price, Urban and US.
lm.fit = lm(Sales~Price+Urban+US, data = Carseats)

# Provide an interpretation of each coefficient in the model. Be careful — 
# some of the variables in the model are qualitative!
print(summary(lm.fit))

# For which of the predictors can you reject the null hypothesis H0 : βj = 0?
print("Based on p-values of Price and US, null hypothesis can be rejected")

# On the basis of your response to the previous question, fit a smaller 
# model that only uses the predictors for which there is evidence of 
# association with the outcome.
lm.fit.small = lm(Sales~Price+US, data = Carseats)
print(summary(lm.fit.small))

# How well do these two models fit the data?
par ( mfrow = c (1 ,2) )
plot(lm.fit$residuals)
plot(lm.fit.small$residuals)
print(anova(lm.fit, lm.fit.small))

# Using the model with less predictors, obtain 95 % confidence intervals for
# the coefficient(s).
print(confint(lm.fit.small))

# Is there evidence of outliers or high leverage observations in the
# model with less predictors
par ( mfrow = c (2 ,2) )
plot(lm.fit.small)
