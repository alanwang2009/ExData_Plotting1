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
png("plot2.png")
#plot base
plot(subdata$DateTime, 
     subdata$Global_active_power, 
     type="n", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
#draw line
lines(subdata$DateTime, subdata$Global_active_power)
#close PNG
dev.off()
