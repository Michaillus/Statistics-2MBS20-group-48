source('import.R')

daily_returns <- (close - open) / open

min_index <- which.min(daily_returns)
max_index <- which.max(daily_returns)

min_date <- date[min_index]
max_date <- date[max_index]

print(min_date)
print(max_date)

plot(date, daily_returns, type='l', col='blue',
     main='Daily Returns of AEX (1995-2024)',
     xlab='Date', ylab='Daily Return Rate')
abline(h=0, col='red', lty=2); 

cat("Numerical Summary of Daily Returns:\n")
print(summary(daily_returns))

cat("\nStandard Deviation (Volatility):\n")
print(sd(daily_returns, na.rm = TRUE))


# -- Graphical Summaries --

# 1. Histogram of Daily Returns
hist(daily_returns, breaks=100, col='lightblue', border='black',
     main='Histogram of Daily Returns',
     xlab='Return Rate')

# 2. Boxplot of Daily Returns
boxplot(daily_returns, col='lightgreen',
        main='Boxplot of Daily Returns',
        ylab='Return Rate',
        horizontal = TRUE)

# 3. Q-Q Plot to check for normality
qqnorm(daily_returns, main='Normal Q-Q Plot of Daily Returns')
qqline(daily_returns, col='red', lwd=2)

# 4. Density Plot (alternative to histogram)
plot(density(daily_returns, na.rm = TRUE), col='darkblue', lwd=2,
     main='Density Plot of Daily Returns')
