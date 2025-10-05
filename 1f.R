# Plots for the task 1f

library(lubridate)

source('import.R')

years = 30
start_year = 1995
year = integer(years)
year_change = numeric(years)
jan_change = numeric(years)

# Make a vector with years from 1995 to 2024
for (i in 1:years) {
  year[i] = start_year - 1 + i
}

# Compute annual price change in percentage. It is computed as difference between closing prices of the last and first recorded day of a year.
for (i in 1:years) {
  start_date = min(date[year(date) == start_year-1+i])
  end_date = max(date[year(date) == start_year-1+i])
  year_change[i] = 100 * ((data[data$Date == end_date, 'Close'] / data[data$Date == start_date, 'Close']) - 1)
}

# Compute price change in January scaled to the whole year. It is computed as difference between closing prices of the last and first recorded day in January.
for (i in 1:years) {
  start_date = min(date[year(date) == start_year-1+i & month(date) == 1])
  end_date = max(date[year(date) == start_year-1+i & month(date) == 1])
  jan_change[i] = 100 * 12*((data[data$Date == end_date, 'Close'] / data[data$Date == start_date, 'Close']) - 1)
}

colors = c('#1a80bb', '#f1a226')

# Define how to save the plot
pdf(file = '1f.pdf',
    width=12,
    height=10)
# Make a bar chart comparing annual and year-on-year January price change.
barplot(rbind(year_change, jan_change),
        names.arg = year,
        main = 'Market performance in January vs the whole year',
        beside = TRUE,
        col = colors,
        ylim=c(-200,100),
        xlab='Year',
        ylab='Change in %')
legend('bottomright',
  legend = c('Annual Change','Year-on-year January Change'),
  col = colors,
  pch=15)

# Compute mean absolute error between annual price change and year-on-year price change in January
mean_abs_error = 0
for (i in 1:years) {
  mean_abs_error <- mean_abs_error + abs(year_change[i] - jan_change[i])
}
mean_abs_error <- mean_abs_error / years
print('Mean absolute error between yearly change and year-on-year january change:')
print(mean_abs_error)

# Compute number of years when growth in January corresponds to annual growth and the other way around
same_sign = 0
for (i in 1:years) {
  same_sign <- same_sign + as.integer(year_change[i] * jan_change[i] >= 0)
}
print('Number of year (out of 30) when growth/declide in january corresponded to yearly growth/decline:')
print(same_sign)