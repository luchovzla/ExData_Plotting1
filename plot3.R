## Exploratory Data Analysis Course Project 1
## plot3.png construction
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
    mutate(Datetime = ymd_hms(paste(Date, " ", Time))) %>% 
    select(Datetime, -(Date:Time), Global_active_power:Sub_metering_3)

## Elaborate plot3 and save to a .png file

png(file = "plot3.png", height = 480, width = 480)
with(df, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(df$Datetime, df$Sub_metering_2, col = "red")
lines(df$Datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()

