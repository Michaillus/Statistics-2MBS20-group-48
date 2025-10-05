year <- format(date, "%Y")
month <- format(date, "%m")

# For each year, find last trading day in May and first trading day in September
years <- unique(year)
may_sep_returns <- numeric()
may_nov_returns <- numeric()

for (y in years) {
  may_idx <- which(year == y & month == "05")
  sep_idx <- which(year == y & month == "09")
  nov_idx <- which(year == y & month == "11")
  if (length(may_idx) > 0 & length(sep_idx) > 0) {
    last_may_close <- close[max(may_idx)]
    first_sep_open <- open[min(sep_idx)]
    first_nov_open <-open[min(nov_idx)]
    may_sep_returns[y] <- (first_sep_open - last_may_close) / last_may_close
    may_nov_returns[y] <- (first_nov_open - last_may_close) / last_may_close
  }
}


# Combine into matrix for side-by-side bars
returns_matrix <- rbind(may_sep_returns, may_nov_returns)

# Create combined barplot
barplot(returns_matrix, beside=TRUE,
        main="AEX Returns Comparison: May–Sep vs May–Nov",
        ylab="Return", xlab="Year",
        col=c("skyblue", "orange"),
        names.arg=years, las=2)
abline(h=0, col="red", lty=2)
legend("topleft", legend=c("May–Sep", "May–Nov"),
       fill=c("skyblue", "orange"), bty="n")

# Plot first density
plot(density(may_sep_returns, na.rm=TRUE),
     col='skyblue', lwd=2,
     main='Density of AEX Returns: May–Sep vs May–Nov',
     xlab='Return')

# Add second density
lines(density(may_nov_returns, na.rm=TRUE),
      col='orange', lwd=2)

legend("topright", legend=c("May–Sep", "May–Nov"),
       col=c("skyblue", "orange"), lwd=2, bty="n")


print(summary(may_sep_returns))
print(summary(may_nov_returns))
print(sd(may_sep_returns))
print(sd(may_nov_returns))



# Quick summary
cat("Average return (May–Sept):", mean(may_sep_returns, na.rm=TRUE), "\n")