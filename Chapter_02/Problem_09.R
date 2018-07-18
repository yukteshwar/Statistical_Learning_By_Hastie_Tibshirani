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
summary(auto)

# Make sure that the missing values have been removed from the data.
auto = na.omit(auto)

# Which of the predictors are quantitative, and which are qualitative?
#auto.class = rep('empty', ncol(auto))
#for(i in 1:ncol(auto))
#{
#  auto.class[i] = class(auto[,i])
#}
auto.class = sapply(auto, class)
print(auto.class)

# What is the range of each quantitative predictor? You can answer this using the range() function.
cat("range(mpg): ", range(auto$mpg))
cat("\nrange(displacement): ", range(auto$displacement))
cat("\nrange(horsepower): ", range(auto$horsepower))
cat("\nrange(weight): ", range(auto$weight))
cat("\nrange(acceleration): ", range(auto$acceleration))

# What is the mean and standard deviation of each quantitative predictor?
cat("\nmean(mpg): ", mean(auto$mpg))
cat("\nmean(displacement): ", mean(auto$displacement))
cat("\nmean(horsepower): ", mean(auto$horsepower))
cat("\nmean(weight): ", mean(auto$weight))
cat("\nmean(acceleration): ", mean(auto$acceleration))
cat("\nstd_dev(mpg): ", sd(auto$mpg))
cat("\nstd_dev(displacement): ", sd(auto$displacement))
cat("\nstd_dev(horsepower): ", sd(auto$horsepower))
cat("\nstd_dev(weight): ", sd(auto$weight))
cat("\nstd_dev(acceleration): ", sd(auto$acceleration))

# Now remove the 10th through 85th observations. What is the range, mean, and standard deviation of each 
# predictor in the subset of the data that remains?
autoNew = auto[c(1:9, 85:nrow(auto)),]
cat("\nmean(mpg): ", mean(autoNew$mpg))
cat("\nmean(displacement): ", mean(autoNew$displacement))
cat("\nmean(horsepower): ", mean(autoNew$horsepower))
cat("\nmean(weight): ", mean(autoNew$weight))
cat("\nmean(acceleration): ", mean(autoNew$acceleration))
cat("\nstd_dev(mpg): ", sd(autoNew$mpg))
cat("\nstd_dev(displacement): ", sd(autoNew$displacement))
cat("\nstd_dev(horsepower): ", sd(autoNew$horsepower))
cat("\nstd_dev(weight): ", sd(autoNew$weight))
cat("\nstd_dev(acceleration): ", sd(autoNew$acceleration))

#Using the full data set, investigate the predictors graphically, using scatterplots or other tools of 
# your choice. Create some plots highlighting the relationships among the predictors. Comment on your findings.
plot(auto)