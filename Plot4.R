# Read txt file
plot4 <- fread('household_power_consumption copy.txt', sep = ';', na.strings = '?')

##Convert Date column into Data type
plot4$Date <- as.Date(plot4$Date, format = "%d/%m/%Y")

##Subsetting only for dates - 2007/02/02 and 2007/02/02
plot4.clean <- subset(plot4, Date >= '2007/02/01' & Date <= '2007/02/02')


##Add new column to plot2.clean with Date and time columns together
datetime <- paste(plot4.clean$Date, plot4.clean$Time)
plot4.clean$datetime <- as.POSIXct(datetime)

#Create plot
par(mfrow = c(2,2))
##First plot
plot(Global_active_power~datetime, plot2.clean, type = 'l', 
    ylab = 'Global Active Power (kilowatts)', xlab = "")
##Second plot
plot(Voltage~datetime, plot2.clean, type = 'l', 
     ylab = 'Voltage')
##Third plot
plot(Sub_metering_1~datetime, plot3.clean, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(Sub_metering_2~datetime, plot3.clean, type = 'l', col = 'red')
lines(Sub_metering_3~datetime, plot3.clean, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = 1, box.lty = 0)

##Fourth plot
plot(Global_reactive_power~datetime, plot2.clean, type = 'l')

##Export in png
dev.copy(png, 'Plot4.png')
dev.off()

