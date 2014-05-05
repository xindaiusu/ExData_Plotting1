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
#names(dat.sub)
#plot 1
png(file = "plot1.png")
hist(Global_active_power, 
     col = 'red',
     xlab = "Global Active Power (kilowatts)",
     main = "")
title("Global Active Power")
dev.off()
