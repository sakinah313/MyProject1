##PLOT 3
##Histogram for Global Actice Power 
##Save the plot to a PNG file with 
#     a width of 480 pixels and a height of 480 pixels.

# Read data from txt file
setwd("/Users/sakinah/Documents/MOOCDataScience/ExploratoryDataAnalysis/Assignment")
dataFile <- "household_power_consumption.txt"
# Put the data into table for further analysis.
dataPower<-read.table(dataFile, header = TRUE,sep=";")

#using data from the dates 2007-02-01 and 2007-02-02
dataSubPower<-dataPower[dataPower$Date %in% c("1/2/2007","2/2/2007") ,]

# call subdata -Time
dataTime <- strptime(paste(dataSubPower$Date, dataSubPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# call subdata -Global Active Power (GAP) and SM1-submetering 1,  SM2-submetering 2,  SM3-submetering 3
dataGAP<-as.numeric(dataSubPower$Global_active_power)
dataSM1<-as.numeric(dataSubPower$Sub_metering_1)
dataSM2<-as.numeric(dataSubPower$Sub_metering_2)
dataSM3<-as.numeric(dataSubPower$Sub_metering_3)
dataVol<-as.numeric(dataSubPower$Voltage)
dataGRP<-as.numeric(dataSubPower$Global_reactive_power)

#save the plot in png
png("plot4.png", width=480, height=480)

#plot the graf
par(mfrow = c(2, 2)) 
plot(dataTime,dataGAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(dataTime,dataVol, type="l", xlab="date time", ylab="Voltage")
plot(dataTime,dataSM1, type="l", col="black",xlab="", ylab="Energy Sub Metering")
lines(dataTime,dataSM2, type="l", col="red")
lines(dataTime,dataSM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dataTime,dataGRP, type="l", xlab="data time", ylab="Global Reactive Power (kilowatts)")


dev.off()

