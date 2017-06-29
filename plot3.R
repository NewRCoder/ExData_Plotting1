#*****************************************************************************************************************************************************************************
#           Exploratory Data Analysis    Week 1 - Course Project 1
#*****************************************************************************************************************************************************************************
#           Plot 3
#*****************************************************************************************************************************************************************************

# Load the dplyr library
library(dplyr)

#   Load the data from the file "household_power_consumption.txt" and filter for the 1st and 2nd of February 2007
Power.Consumption.Subset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

#   Combine the columns "Date" and "Time" to create a and column named "DateTime"
Power.Consumption.Subset$DateTime <- with(Power.Consumption.Subset, paste(Date, Time))

#   Convert the column "DateTime" from "chr" to "POSIXct"
Power.Consumption.Subset$DateTime <- with(Power.Consumption.Subset, as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S"))

#   Open the png graphic device, set the name of the file to "plot3.png" with a height and width of 480px
png("plot3.png", width = 480, height = 480)

#   Plot data for "Sub_metering_1"
with(Power.Consumption.Subset, plot(DateTime, Sub_metering_1, ylab = "Global Active Power (kilowatts)", xlab='', type='l'))

#   Add connected line segments to existing plot for "Sub_metering_2" with colour properties set to "red"
with(Power.Consumption.Subset, lines(DateTime, Sub_metering_2, col="red"))

#   Add connected line segments to existing plot for "Sub_metering_3" with colour properties set to "blue"
with(Power.Consumption.Subset, lines(DateTime, Sub_metering_3, col="blue"))

#   Add legend to existing plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col=c("black", "red", "blue"))

#   Shutdown the graphic device
dev.off()
