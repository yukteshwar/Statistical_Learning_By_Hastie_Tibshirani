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

# Produce a scatterplot matrix which includes all of the variables in 
# the data set.
plot(auto)

# Compute the matrix of correlations between the variables using
# the function cor() . You will need to exclude the name variable,
# cor() which is qualitative.
drops <- c("cylinders","origin", "year", "name")
auto.quant = auto[ , !(names(auto) %in% drops)]
#auto.quant$horsepower = as.numeric(auto.quant$horsepower)
#auto.quant$weight = as.numeric(auto.quant$weight)
#na.omit(auto.quant)
print(cor(na.omit(auto.quant)))

# Use the lm() function to perform a multiple linear regression
# with mpg as the response and all other variables except name as
# the predictors. Use the summary() function to print the results.
# Comment on the output.
drops <- c("name")
auto.fit = auto[ , !(names(auto) %in% drops)]
auto.fit = na.omit(auto.fit)
lm.fit = lm(mpg~., data = auto.fit)
print(summary(lm.fit))
print("Based on p-values, displacement, weight, year & origin are significant")
print("Coeff of year, along with Std. Error & p-value shows that it is significant")

# Use the plot() function to produce diagnostic plots of the linear regression fit. 
# Comment on any problems you see with the fit. Do the residual plots suggest any 
# unusually large outliers? Does the leverage plot identify any observations with 
# unusually high leverage?
par ( mfrow = c (2 ,2) )
plot(lm.fit)