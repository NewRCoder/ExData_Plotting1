#*****************************************************************************************************************************************************************************
#           Exploratory Data Analysis    Week 1 - Course Project 1
#*****************************************************************************************************************************************************************************
#           Plot 2
#*****************************************************************************************************************************************************************************

# Load the dplyr library
library(dplyr)

#   Load the data from the file "household_power_consumption.txt" and filter for the 1st and 2nd of February 2007
Power.Comsumption.Subset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

#   Combine the columns "Date" and "Time" to create a and column named "DateTime"
Power.Comsumption.Subset$DateTime <- with(Power.Comsumption.Subset, paste(Date, Time))

#   Convert the column "DateTime" from "chr" to "POSIXct"
Power.Comsumption.Subset$DateTime <- with(Power.Comsumption.Subset, as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S"))

#   Open the png graphic device, set the name of the file to "plot2.png" with a height and width of 480px
png("plot2.png", width = 480, height = 480)

# Plot data
with(Power.Comsumption.Subset, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab='', type='l'))

#   Shutdown the graphic device
dev.off()