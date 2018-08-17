setwd("C:/Users/ah64717/datasciencecoursera/Assignment Course4 Week1")
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filenm = "Electric.zip"
#download.file(url, filenm)
#unzip(filenm, overwrite = TRUE)
setwd("C:/Users/ah64717/datasciencecoursera/Assignment Course4 Week1")
Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
Data <- subset(Data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation

Data <- Data[complete.cases(Data),]

DateTime <- paste(as.Date(Data$Date), Data$Time)
Data <- cbind(DateTime, Data)
Data$DateTime <- as.POSIXct(DateTime)



plot(Data$DateTime, Data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()




