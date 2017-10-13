## Exploratory Data Analysis Week 1 ##

## Loading the data

electric_data <- read.delim(
    "household_power_consumption.txt", 
    stringsAsFactors = FALSE,
    sep = ";"
)

## Preliminary cleaning the data

library(lubridate)

electric_data$Date <- as.Date(electric_data$Date, "%d/%m/%Y")
electric_data <- subset(electric_data, Date == "2007-02-01" | Date == "2007-02-02")
electric_data$Global_active_power <- as.numeric(electric_data$Global_active_power)
electric_data$Date_Time <- paste(electric_data$Date, electric_data$Time, sep=" ")
electric_data$Date_Time <- as.POSIXlt(electric_data$Date_Time, format="%Y-%m-%d %H:%M:%S")

#Please note that weekdays are in polish (I am writing from Poland)

#Plot 3

png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(electric_data, plot(Date_Time,
                         pmax(Sub_metering_1, Sub_metering_2, Sub_metering_3), #to ensure that heigh of plot is appropriate,
                         type = "n",
                         xlab = "",
                         ylab = "Energy sub metering"))
with(electric_data,lines(Date_Time, Sub_metering_1, col = "black"))
with(electric_data,lines(Date_Time, Sub_metering_2, col = "red"))
with(electric_data,lines(Date_Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
