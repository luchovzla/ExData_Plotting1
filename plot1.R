## Exploratory Data Analysis Course Project 1
## plot1.png construction
## By: Luis Gomez

library(lubridate)
library(tidyverse)

## Read data set and extract pertinent data

df <- read_csv2("household_power_consumption.txt", na = "?") %>%
    mutate(Date = dmy(Date),
           across(where(is.character), as.numeric)) %>%
    filter(Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

## Elaborate plot1 and save to a .png file

png(file = "plot1.png", height = 480, width = 480)
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

