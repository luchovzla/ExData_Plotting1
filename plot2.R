## Exploratory Data Analysis Course Project 1
## plot2.png construction
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

## Elaborate plot2 and save to a .png file

png(file = "plot2.png", height = 480, width = 480)
with(df, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

