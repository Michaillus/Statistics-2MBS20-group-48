source('import.R')

pdf(file="1a.pdf",
    width=14)
par(mfrow = c(1,2))

plot(date, open,
     type='l',
     main='Opening prices',
     col='orange',
     xlab='Date',
     ylab='Opening price')
plot(date, close,
     type='l',
     main='Closing prices',
     col='blue',
     xlab='Date',
     ylab='Closing price')

dev.off()
