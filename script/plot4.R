dat <- read.delim("D:\\Coursera\\EDA_RPeng\\household_power_consumption.txt",
                  sep = ";", 
                  colClasses = c(rep("character",2), rep("numeric", 7)), 
                  na.strings = "?")
#str(dat)
dat.sub <- subset(dat, Date == '1/2/2007' | Date =='2/2/2007')
dat.sub$DateNew <- as.Date(dat.sub$Date, "%d/%m/%Y")
dat.sub$TimeNew <- strptime(paste(dat.sub$Date, dat.sub$Time), 
                            "%d/%m/%Y %H:%M:%S")

attach(dat.sub)

#plot4
daterange <- round(range(TimeNew), "day")
atlevel <- seq(daterange[1], daterange[2], "day")
xlabel <- format(atlevel, "%a")
old.par <- par()

png(file = "plot4.png")
plot.new()
par(omi = c(0,0,0,0))
par(mfrow = c(2,2))
par(cex = 0.7)
plot(TimeNew, Global_active_power,
     type = "l", xaxt = "n",
     xlab = "",ylab = "Global active power")
axis.POSIXct(1, at = atlevel, format = "%a" )

plot(TimeNew, Voltage, 
     type = "l", xaxt = "n", 
     xlab = "datetime")
axis.POSIXct(1, at = atlevel, format = "%a" )

plot(TimeNew, Sub_metering_1, 
     type = "l", xaxt = "n",
     xlab = "", ylab = "Energy sub metering")
axis.POSIXct(1, at = atlevel, format = "%a" )
lines(TimeNew, Sub_metering_2, col = "red")
lines(TimeNew, Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", cex = 0.75,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(TimeNew, Global_reactive_power, 
     type = "l", xaxt = "n", 
     xlab = "datetime")
axis.POSIXct(1, at = atlevel, format = "%a" )

dev.off()

detach(dat.sub)


