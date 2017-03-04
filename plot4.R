#read Data
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,
                 colClasses = c('character', 'character', 'numeric',
                                'numeric', 'numeric', 'numeric',
                                'numeric', 'numeric', 'numeric'),
                 na.strings='?')
#select data of 2 days
subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
#combine date and time
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), 
                             "%d/%m/%Y %H:%M:%S")
#open PNG
png("plot4.png")

# Configure multiplot
par(mfrow=c(2,2))

# Global Active Power plot
plot(subdata$DateTime, 
     subdata$Global_active_power, 
     type="n", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(subdata$DateTime, subdata$Global_active_power)

# Voltage plot
plot(subdata$DateTime, subdata$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(subdata$DateTime, subdata$Voltage)

# Submetering plot
plot(subdata$DateTime, 
     subdata$Sub_metering_1, 
     type="n", 
     xlab="", 
     ylab="Energy sub metering")
lines(subdata$DateTime, subdata$Sub_metering_1)
lines(subdata$DateTime, subdata$Sub_metering_2, col='red')
lines(subdata$DateTime, subdata$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Global reactive power plot
with(subdata, plot(DateTime, Global_reactive_power, xlab='datetime', type="n"))
with(subdata, lines(DateTime, Global_reactive_power))

# Close PNG
dev.off()