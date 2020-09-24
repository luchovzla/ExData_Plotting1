## Exploratory Data Analysis Course Project 1
## plot4.png construction
## By: Luis Gomez

library(lubridate)
library(tidyverse)

## Read data set and extract pertinent data

df <- read_csv2("household_power_consumption.txt", na = "?") %>%
    mutate(
        Date = dmy(Date),
        across(where(is.character), as.numeric)
        ) %>%
    filter(Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))) %>%
    mutate(datetime = ymd_hms(paste(Date, " ", Time))) %>% 
    select(datetime, -(Date:Time), Global_active_power:Sub_metering_3)

## Set plot parameters to be able to hold 4 plots in a single file and open a .png file to hold plots

png(file = "plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2), mfcol = c(2, 2))

## 1st plot

with(df, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

## 2nd plot

with(df, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

## 3rd plot

with(df, plot(datetime, Voltage / 1000, type = "l", ylab = "Voltage"))

## 4th plot

with(df, plot(datetime, Global_reactive_power, type = "l"))

## Close device

dev.off()