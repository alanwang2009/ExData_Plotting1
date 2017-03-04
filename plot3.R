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
png("plot3.png")
#plot base
plot(subdata$DateTime, 
     subdata$Sub_metering_1 , 
     type="n", 
     xlab="", 
     ylab="Energy sub metering")
#draw lines
lines(subdata$DateTime, subdata$Sub_metering_1)
lines(subdata$DateTime, subdata$Sub_metering_2,col="red")
lines(subdata$DateTime, subdata$Sub_metering_3,col="blue")
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

#close PNG
dev.off()