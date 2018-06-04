# Read txt file
plot3 <- fread('household_power_consumption copy.txt', sep = ';', na.strings = '?')

##Convert Date column into Data type
plot3$Date <- as.Date(plot3$Date, format = "%d/%m/%Y")

##Subsetting only for dates - 2007/02/02 and 2007/02/02
plot3.clean <- subset(plot3, Date >= '2007/02/01' & Date <= '2007/02/02')


##Add new column to plot2.clean with Date and time columns together
datetime <- paste(plot3.clean$Date, plot3.clean$Time)
plot3.clean$datetime <- as.POSIXct(datetime)

##Create plot
plot(Sub_metering_1~datetime, plot3.clean, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(Sub_metering_2~datetime, plot3.clean, type = 'l', col = 'red')
lines(Sub_metering_3~datetime, plot3.clean, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = 1)
##Export in png
dev.copy(png, 'Plot3.png')
dev.off()

