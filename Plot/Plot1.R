setwd("C:/Users/ah64717/datasciencecoursera")
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filenm = "Electric.zip"
download.file(url, filenm)
unzip(filenm, overwrite = TRUE)
Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
Data <- subset(Data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation

Data <- Data[complete.cases(Data),]

SetTime <-strptime(paste(Data$Date, Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Data <- cbind(SetTime, Data)

#Plotting the data

hist(Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Creating PNG file

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()