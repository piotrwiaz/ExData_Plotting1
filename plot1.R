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

#Plot 1

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(x = electric_data$Global_active_power,
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
