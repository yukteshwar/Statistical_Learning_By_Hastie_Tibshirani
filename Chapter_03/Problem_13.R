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

# Make sure to use set.seed(1) prior to starting part (a) to ensure consistent results.
set.seed(1)

# Using the rnorm() function, create a vector, x , containing 100 observations
# drawn from a N (0, 1) distribution. This represents a feature, X.
x = rnorm(100)

# Using the rnorm() function, create a vector, eps , containing 100 observations 
# drawn from a N (0, 0.25) distribution i.e. a normal distribution with mean zero 
# and variance 0.25.
eps = rnorm(100, 0, sqrt(0.25))

# Using x and eps , generate a vector y according to the model
y = -1 + 0.5*x + eps
print(length(y))
print("beta_0 = -1 & beta_1 = 0.5")

# Create a scatterplot displaying the relationship between x and y . 
# Comment on what you observe.
plot(x,y)

# Fit a least squares linear model to predict y using x . Comment on the model 
# obtained. How estimated coefficients differ?
lm.fit = lm(y~x)
print(lm.fit$coefficients)

# Display the least squares line on the scatterplot obtained in (d).
# Draw the population regression line on the plot, in a different color. 
# Use the legend() command to create an appropriate legend.
abline(lm.fit, lwd = 3, col = "red")
legend(-2.2, 0.1, legend = c("y = -1 + 0.5*x + eps", "lm(y~x)"), col = c("black", "red"),
       lty=1:2, cex=0.8)

# Now fit a polynomial regression model that predicts y using x and x^2 . 
# Is there evidence that the quadratic term improves the model fit? 
# Explain your answer.
lm.fitpoly = lm(y~x + I(x^2))
