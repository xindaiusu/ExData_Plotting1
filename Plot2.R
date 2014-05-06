dat <- read.delim("D:\\Coursera\\EDA_RPeng\\household_power_consumption.txt",
                  sep = ";", 
                  colClasses = c(rep("character",2), rep("numeric", 7)), 
                  na.strings = "?")
dat.sub <- subset(dat, Date == '1/2/2007' | Date =='2/2/2007')
dat.sub$DateNew <- as.Date(dat.sub$Date, "%d/%m/%Y")
dat.sub$TimeNew <- strptime(paste(dat.sub$Date, dat.sub$Time), 
                            "%d/%m/%Y %H:%M:%S")

#plot2
png(file = "plot2.png")
GAP.ts <- ts(dat.sub$Global_active_power, 
             frequency = 1440, 
             start = 1)
plot.ts(GAP.ts, xaxt = "n",
        xlab = "",
        ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1,2,3), labels = c("Thu", "Fri", "Sat"))
dev.off()
