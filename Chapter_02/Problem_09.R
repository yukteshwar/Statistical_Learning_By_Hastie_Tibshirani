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