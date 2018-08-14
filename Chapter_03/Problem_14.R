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

# Perform the following commands in R :
set.seed (1)
x1 = runif (100)
x2 = 0.5* x1 + rnorm (100) /10
y = 2+2* x1 +0.3* x2 + rnorm (100)

# The last line corresponds to creating a linear model in which y is
# a function of x1 and x2 .

# Write out the form of the linear model.
print("y = 2 + 2x1 + 0.3x2\n")

# What are the regression coefficients?
print("beta_0 = 2, beta_1 = 2, beta_2 = 0.3\n")

# What is the correlation between x1 and x2 ? Create a scatterplot
# displaying the relationship between the variables
print(cor(x1,x2))
plot(x1, x2, xlab="x1", ylab="x2")

# Using this data, fit a least squares regression to predict y using
# x1 and x2 . Describe the results obtained. What are regression
# coefficients
lm.fit1 = lm(y~x1+x2)
print(summary(lm.fit1))
print("Based on individual p-values, we can reject beta_1 = 0 & beta_2 = 0. But based on overall p-value, we can't.")

# Now fit a least squares regression to predict y using only x1 .
# Comment on your results. Can you reject the null hypothesis H0 : beta_1 = 0
lm.fit2 = lm(y~x1)
print(summary(lm.fit2))
print("We can't reject the null hypothesis H0 : beta_1 = 0")

# Now fit a least squares regression to predict y using only x2 .
# Comment on your results. Can you reject the null hypothesis H0 : beta_1 = 0
lm.fit3 = lm(y~x2)
print(summary(lm.fit3))
print("We can't reject the null hypothesis H0 : beta_1 = 0")

# Do the results obtained in (c)–(e) contradict each other? 
# Explain your answer.
print("x1 & x2 are correlated")

# Now suppose we obtain one additional observation, which was 
# unfortunately mismeasured.
x1 = c(x1,0.1)
x2 = c(x2,0.8)
y = c(y,6)

# Re-fit the linear models from (c) to (e) using this new data. 
# What effect does this new observation have on the each of the models?
# In each model, is this observation an outlier? 
# A high-leverage point? Both? 
# Explain your answers.
lm.fit1 = lm(y~x1+x2)
print(summary(lm.fit1))
print("Based on individual p-values, we can reject beta_1 = 0.")
# run this if it's your first time using it to install
#install.packages("plot3D")
library("plot3D")
scatter3D(x1, x2, y, clcolvar = NULL, col = "blue",
          pch = 19, cex = 0.5, xlab = "x1", ylab = "x2", zlab = "y")

lm.fit1 = lm(y~x1)
print(summary(lm.fit1))
print("We can't reject the null hypothesis H0 : beta_1 = 0")
par ( mfrow = c (2 ,2) )
plot (lm.fit1 )

lm.fit1 = lm(y~x2)
print(summary(lm.fit1))
print("We can't reject the null hypothesis H0 : beta_1 = 0")
plot (lm.fit1 )
par ( mfrow = c (2 ,2) )
plot (lm.fit1 )