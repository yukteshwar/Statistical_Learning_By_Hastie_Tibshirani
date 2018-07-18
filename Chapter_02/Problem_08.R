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

# Read College data set
college = read.csv("College.csv")

# Look at the data using the fix() function
fix(college)

# Change first column as row names
rownames ( college ) = college [ ,1]
fix(college)

# Eliminate the first column in the data
college = college [ , -1]
fix(college)

# Use the summary() function to produce a numerical summary of the variables 
# in the data set.
summary(college)

# Use the pairs() function to produce a scatterplot matrix of the first ten 
# columns or variables of the data.
pairs(college[,1:10])

# Use the plot() function to produce side-by-side boxplots of Outstate versus Private.
plot(college$Private, college$Outstate, main = "Outstate versus Private", xlab = "Private", 
     ylab = "Outstate")

# Create a new qualitative variable, called Elite , by binning the Top10perc 
# variable. We are going to divide universities into two groups based on 
# whether or not the proportion of students coming from the top 10 % of their 
# high school classes exceeds 50 %.
Elite = rep (" No " , nrow ( college ) )
Elite[college$Top10perc > 50] = " Yes "
Elite = as.factor (Elite)
college = data.frame(college, Elite)

# Use the summary() function to see how many elite universities there are.
summary(college)

# Use the plot() function to produce side-by-side boxplots of Outstate versus Elite.
plot(college$Elite, college$Outstate, main = "Outstate versus Elite", xlab = "Elite", 
     ylab = "Outstate")

# Use the hist() function to produce some histograms with differing numbers 
# of bins for a few of the quantitative variables. You may find the command 
# par(mfrow=c(2,2)) useful: it will divide the print window into four regions 
# so that four plots can be made simultaneously. Modifying the arguments to 
# this function will divide the screen in other ways.
par(mfrow=c(2,2))
hist(college$Room.Board)
hist(college$Books)
hist(college$Enroll)
hist(college$S.F.Ratio)