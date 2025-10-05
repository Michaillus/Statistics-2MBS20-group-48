# Plot for the task 1a

source('import.R')

# Define how to save the plot
pdf(file="1a.pdf",
    width=12,
    height=16)
par(mfrow = c(2,1))

# Plot daily opening prices
plot(date, open,
     type='p',
     main='Opening prices',
     col='orange',
     xlab='Date',
     ylab='Price',
     cex=0.5)
# Plot daily closing prices
plot(date, close,
     type='p',
     main='Closing prices',
     col='blue',
     xlab='Date',
     ylab='Price',
     cex=0.5)

dev.off()
