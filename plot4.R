#plot 4

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))

data$DT <- paste(data$Date, data$Time, sep = " ")
data$DT <- strptime(data$DT, "%d/%m/%Y %T")

data$Date <- strptime(data$Date, "%d/%m/%Y")

data <- subset(data, data$Date == "2007-02-01" | data$Date =="2007-02-02")

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
#topright
plot(data$DT, data$Global_active_power, type ="l", 
     xlab = "", ylab = "Global Active Power")

#bottom right

plot(data$DT, data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

#top left

plot(data$DT, data$Sub_metering_1, type ="l", 
     xlab = "", ylab = "Energy sub metering")

lines(data$DT, data$Sub_metering_2, col = "red")

lines(data$DT, data$Sub_metering_3, col = "blue")

legend("topright", pch = c(NA, NA, NA), lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       y.intersp = 1, x.intersp = 1, bty = "n")

#bottom right

plot(data$DT, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", lwd = 0.25)


dev.off()

?par
