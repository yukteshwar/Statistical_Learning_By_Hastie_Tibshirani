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

# Now the data set is contained in the object Boston.
head(Boston)

# Read about the data set:
?Boston

# How many rows are in this data set? How many columns? What do the rows and columns represent?
cat("nRows = ", nrow(Boston))
cat("\nnCols = ", ncol(Boston))
cat("\nColumn Details:\n")
print(sapply(Boston, class))

# Make some pairwise scatterplots of the predictors (columns) in this data set. Describe your findings.
par(mfrow=c(3,2))
plot(Boston$nox, Boston$age)
plot(Boston$nox, Boston$dis)
plot(Boston$indus, Boston$dis)
plot(Boston$rm, Boston$medv)
plot(Boston$lstat, Boston$medv)
plot(Boston$lstat, Boston$rm)

# Are any of the predictors associated with per capita crime rate? If so, explain the relationship.
par(mfrow=c(4,4))
plot(Boston$crim, Boston$zn)
plot(Boston$crim, Boston$indus)
plot(Boston$crim, Boston$chas)
plot(Boston$crim, Boston$nox)
plot(Boston$crim, Boston$rm)
plot(Boston$crim, Boston$age)
plot(Boston$crim, Boston$dis)
plot(Boston$crim, Boston$rad)
plot(Boston$crim, Boston$tax)
plot(Boston$crim, Boston$ptratio)
plot(Boston$crim, Boston$black)
plot(Boston$crim, Boston$lstat)
plot(Boston$crim, Boston$medv)

# Do any of the suburbs of Boston appear to have particularly high crime rates? 
# Tax rates? Pupil-teacher ratios? Comment on the range of each predictor.
par(mfrow=c(1,3))
boxplot(Boston$crim, main="Crime rates")
boxplot(Boston$tax,  main="Tax rates")
boxplot(Boston$ptratio, main="Pupil-teacher ratios")

# How many of the suburbs in this data set bound the Charles river?
cat("\nNumber of suburbs bound the Charlesriver = ", length(which(Boston$chas == 1)))

# What is the median pupil-teacher ratio among the towns in this data set?
cat("\nMedian pupil-teacher ratio = ", median(Boston$ptratio))

# Which suburb of Boston has lowest median value of owner-occupied homes? 
# What are the values of the other predictors for that suburb, and how do 
# those values compare to the overall ranges for those predictors? 
# Comment on your findings.
minIdx = which(Boston$medv==min(Boston$medv))
cat("\nLowest median value of owner-occupied homes = ", minIdx)
cat("\nThe values of the other predictors for that suburbs:\n")
print(Boston[minIdx,])

# In this data set, how many of the suburbs average more than seven rooms 
# per dwelling? More than eight rooms per dwelling? Comment on the suburbs 
# that average more than eight rooms per dwelling.
cat("\nNumber of suburbs average more than seven rooms per dwelling = ", length(which(Boston$rm > 7)))
cat("\nNumber of suburbs average more than eight rooms per dwelling = ", length(which(Boston$rm > 8)))
