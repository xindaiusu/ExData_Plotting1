dat <- read.delim("D:\\Coursera\\EDA_RPeng\\household_power_consumption.txt",
                  sep = ";", 
                  colClasses = c(rep("character",2), rep("numeric", 7)), 
                  na.strings = "?")
dat.sub <- subset(dat, Date == '1/2/2007' | Date =='2/2/2007')
dat.sub$DateNew <- as.Date(dat.sub$Date, "%d/%m/%Y")
dat.sub$TimeNew <- strptime(paste(dat.sub$Date, dat.sub$Time), 
                            "%d/%m/%Y %H:%M:%S")

#plot3
attach(dat.sub)
png(file = "plot3.png")
plot(Sub_metering_1, type = "n", xaxt = "n", 
     xlab = "", 
     ylab = "Energy sub metering")
axis(1,  at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
lines(Sub_metering_1, col = 'black', xaxt = "n", xlab = "", ylab = "")
lines(Sub_metering_2, col = "red", xaxt = "n", xlab = "", ylab = "")
lines(Sub_metering_3, col = "blue", xaxt = "n", xlab = "", ylab = "")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()