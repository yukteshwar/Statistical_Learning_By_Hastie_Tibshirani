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

# Read Auto data set
auto = read.csv("Auto.csv", header = T, na.strings = "?")
#auto = read.table("Auto.data", header = T, na.strings = "?")

# Use the lm() function to perform a simple linear regression with
# mpg as the response and horsepower as the predictor. Use the
# summary() function to print the results. Comment on the output.
attach(auto)
lm.fit = lm(mpg~horsepower)
print(summary(lm.fit))

# Is there a relationship between the predictor and the response?
print("Yes, based on overall p-value")
# How strong is the relationship between the predictor and the response?
print("Small value of Std. Error provide strong evidence that there is a\n
      relationship between predictor and response")
# Is the relationship between the predictor and the response positive 
# or negative?
print("negative")
# What is the predicted mpg associated with a horsepower of 98? 
# What are the associated 95 % confidence and prediction intervals?
print(predict(lm.fit,data.frame(horsepower=98), interval = "confidence"))
print(predict(lm.fit,data.frame(horsepower=98), interval = "prediction"))

# Plot the response and the predictor. Use the abline() function
# to display the least squares regression line.
plot(mpg~horsepower, pch = 20)
abline(lm.fit)

# Use the plot() function to produce diagnostic plots of the least
# squares regression fit. Comment on any problems you see with the fit.
par ( mfrow = c (2 ,2) )
plot ( lm.fit )