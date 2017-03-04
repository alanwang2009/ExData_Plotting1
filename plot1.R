#read Data
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,
                 colClasses = c('character', 'character', 'numeric',
                                'numeric', 'numeric', 'numeric',
                                'numeric', 'numeric', 'numeric'),
                 na.strings='?')
#select data of 2 days
subdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
# Open plot1.png
png("plot1.png")

# Build histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()