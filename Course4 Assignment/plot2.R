library(plyr)
library(ggplot2)

setwd("C:/Users/ah64717/Desktop/DS Assignments/PM data")
smry <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

Balti <- subset(smry, fips == "24510")

TotalPMI <- tapply(Balti$Emissions, Balti$year, sum)

plot(names(TotalPMI), TotalPMI, type = "l", xlab = "Year", 
     ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main = expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year"))
dev.copy(png,"plot1.png")
dev.off()