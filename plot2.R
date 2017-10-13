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

#Plot 2

png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(electric_data, plot(Date_Time,
                         Global_active_power,
                         type = "n",
                         xlab = "",
                         ylab = "Global Active Power(kilowatts)"))
with(electric_data,lines(Date_Time, Global_active_power))

dev.off()
