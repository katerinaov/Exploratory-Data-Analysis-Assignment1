## Read txt file
plot1 <- fread('household_power_consumption copy.txt', sep = ';', na.strings = '?')

##Convert Date column into Data type
plot1$Date <- as.Date(plot1$Date, format = "%d/%m/%Y")

##Subsetting only for dates - 2007/02/02 and 2007/02/02
plot1.clean <- subset(plot1, Date >= '2007/02/01' & Date <= '2007/02/02')

##Create histogram
hist(plot1.clean$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
##Export histogram as png 
dev.copy(png, file = 'plot1.png')
dev.off()