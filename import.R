file <- 'AEX_1995_2024.csv'
data <- read.csv(file, colClasses=c('Date','numeric','numeric','numeric','numeric','integer','numeric'))

date <- data$Date
open <- data$Open
close <- data$Close
high <- data$High
low <- data$Low
volume <- data$Volume
change <- data$Change

