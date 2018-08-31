library(plyr)
library(ggplot2)

setwd("C:/Users/ah64717/Desktop/DS Assignments/PM data")
smry <- readRDS("summarySCC_PM25.rds")
src <- readRDS("Source_Classification_Code.rds")

greps1<-unique(grep("coal", src$EI.Sector, ignore.case=TRUE, value=TRUE))  



#Isolate instances of "coal" in SCC column EI.Sector

data1<-subset(src, EI.Sector %in% greps1)    #Subset SCC by coal labels

coal<-subset(smry, SCC%in%data1$SCC)        #Subset NEI by data1 overlaps


ggplot(data=coal, aes(x=year, y=Emissions, fill = type)) + 
  geom_bar(stat="identity", position=position_dodge()) + 
  ggtitle("U.S. Coal Combustion-Related Emissions: 1999-2008")

dev.copy(png,"plot4.png")
dev.off()