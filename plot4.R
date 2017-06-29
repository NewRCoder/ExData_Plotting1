#*****************************************************************************************************************************************************************************
#           Exploratory Data Analysis    Week 1 - Course Project 1
#*****************************************************************************************************************************************************************************
#           Plot 4
#*****************************************************************************************************************************************************************************

# Load the dplyr library
library(dplyr)

#   Load the data from the file "household_power_consumption.txt" and filter for the 1st and 2nd of February 2007
Power.Comsumption.Subset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

#   Combine the columns "Date" and "Time" to create a and column named "DateTime"
Power.Comsumption.Subset$DateTime <- with(Power.Comsumption.Subset, paste(Date, Time))

#   Convert the column "DateTime" from "chr" to "POSIXct"
Power.Comsumption.Subset$DateTime <- with(Power.Comsumption.Subset, as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S"))

#   Open the png graphic device, set the name of the file to "plot4.png" with a height and width of 480px
png("plot4.png", width = 480, height = 480)

#   Create two rows and two columns
par(mfrow=c(2,2))

#   Plot data for "Global Active Power" in the first row and first column
with(Power.Comsumption.Subset, plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab='', type='l'))

#   Plot data for "Voltage" in the first row and second column
with(Power.Comsumption.Subset, plot(DateTime, Voltage, ylab = "Voltage", xlab='datetime', type='l'))

#   Plot data for "Sub_metering_1" in the second row and first column
with(Power.Comsumption.Subset, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab='', type='l'))

#   Add connected line segments to plot in the second row and first column for "Sub_metering_2" with colour properties set to "red"
with(Power.Comsumption.Subset, lines(DateTime, Sub_metering_2, col="red"))

#   Add connected line segments to plot in the second row and first column for "Sub_metering_3" with colour properties set to "blue"
with(Power.Comsumption.Subset, lines(DateTime, Sub_metering_3, col="blue"))

#   Add legend to plot in the second row and first column
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col=c("black", "red", "blue"), bty = "n")

#   Plot data for "Global_reactive_power" in the second row and second column
with(Power.Comsumption.Subset, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab='datetime', type='l'))

#   Shutdown the graphic device
dev.off()