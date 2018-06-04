## Read txt file
plot2 <- fread('household_power_consumption copy.txt', sep = ';', na.strings = '?')

##Convert Date column into Data type
plot2$Date <- as.Date(plot2$Date, format = "%d/%m/%Y")

##Subsetting only for dates - 2007/02/02 and 2007/02/02
plot2.clean <- subset(plot2, Date >= '2007/02/01' & Date <= '2007/02/02')


##Add new column to plot2.clean with Date and time columns together
datetime <- paste(plot2.clean$Date, plot2.clean$Time)
plot2.clean$datetime <- as.POSIXct(datetime)

##Create a plot
plot(Global_active_power~datetime, plot2.clean, type = 'l', 
     ylab = 'Global Active Power (kilowatts)', xlab = "")

##Export to png
dev.copy(png, 'Plot2.png')
dev.off()
              
 