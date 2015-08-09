##PLOT 1
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

# call subdata -Global Active Power (GAP)
dataGAP<-as.numeric(dataSubPower$Global_active_power)

#save the plot in png
png("plot1.png", width=480, height=480)
#plot the histogram
hist(dataGAP,col = "red",main = "Global Active Power", xlab="Global Active Power (kilowatt)",ylab="Frequency")
dev.off()
