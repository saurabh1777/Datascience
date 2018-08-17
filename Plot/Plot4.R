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

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colln <- c("black","red","blue")
par(mfrow=c(2,2))
plot(Data$DateTime, Data$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(Data$DateTime, Data$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(Data$DateTime, Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data$DateTime, Data$Sub_metering_2, type="l", col="red")
lines(Data$DateTime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=colln)
plot(Data$DateTime, Data$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()