library(lubridate)

source('import.R')

years = 30
start_year = 1995
changes = data.frame(Year=integer(years), Year_change=numeric(years), Jan_change=numeric(years))

for (i in 1:years) {
  changes$Year[i] = start_year - 1 + i
}

for (i in 1:years) {
  start_date = min(date[year(date) == start_year-1+i])
  end_date = max(date[year(date) == start_year-1+i])
  changes$Year_change[i] = (data[data$Date == end_date, 'Close'] / data[data$Date == start_date, 'Close']) - 1
}

for (i in 1:years) {
  start_date = min(date[year(date) == start_year-1+i & month(date) == 1])
  end_date = max(date[year(date) == start_year-1+i & month(date) == 1])
  changes$Jan_change[i] = (data[data$Date == end_date, 'Close'] / data[data$Date == start_date, 'Close']) - 1
}

pdf(file = '1f.pdf')
plot(changes$Year, changes$Year_change,
     type='b',
     col='orange',
     xlab='Year',
     ylab='Change')
lines(changes$Year, changes$Jan_change,
     type='b',
     col='blue')
abline(
  h=0,
  col='black',
  lwd=1
)

