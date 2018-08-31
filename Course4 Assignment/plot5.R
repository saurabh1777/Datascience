library(plyr)
library(ggplot2)

setwd("C:/Users/ah64717/Desktop/DS Assignments/PM data")
smry <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

Bmotor <- subset(smry, smry$fips == "24510" & smry$type == "ON-ROAD")
Bmotortot <- tapply(Bmotor$Emissions, Bmotor$year, sum)


plot(names(Bmotortot), Bmotortot, type = "l",xlab = "Year", ylab = "Emissions",
     main = "Motor Vehicle-Related Emissions in Baltimore, MD: 1999-2008")
dev.copy(png,"plot5.png")
dev.off()