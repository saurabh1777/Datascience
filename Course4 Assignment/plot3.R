library(plyr)
library(ggplot2)

setwd("C:/Users/ah64717/Desktop/DS Assignments/PM data")
smry <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

Balti <- subset(smry, fips == "24510")

g<-ggplot(Balti,aes(year,Emissions,color=type))

g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions for Baltimore City ",x="Year (1999 - 2008)")
dev.copy(png,"plot3.png")
dev.off()