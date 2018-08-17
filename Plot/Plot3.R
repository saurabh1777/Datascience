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

colln <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Data$DateTime, Data$Sub_metering_1, type="l", col=colln[1], xlab="", ylab="Energy sub metering")
lines(Data$DateTime, Data$Sub_metering_2, col=colln[2])
lines(Data$DateTime, Data$Sub_metering_3, col=colln[3])
legend("topright", legend=labels, col=colln, lty="solid")
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()