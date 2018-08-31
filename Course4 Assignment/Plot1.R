library(plyr)
library(ggplot2)

setwd("C:/Users/ah64717/Desktop/DS Assignments/PM data")
smry <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")
TotalPMI <- tapply(smry$Emissions, smry$year, sum)
plot(names(TotalPMI), TotalPMI, type = "l",
     xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))