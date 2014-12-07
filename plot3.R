#Plot 3

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))

data$DT <- paste(data$Date, data$Time, sep = " ")
data$DT <- strptime(data$DT, "%d/%m/%Y %T")

data$Date <- strptime(data$Date, "%d/%m/%Y")

data <- subset(data, data$Date == "2007-02-01" | data$Date =="2007-02-02")

data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot3.png", width = 480, height = 480)
plot(data$DT, data$Sub_metering_1, type ="l", 
     xlab = "", ylab = "Energy sub metering", cex.lab = 1, 
     cex.axis = 0.9)

lines(data$DT, data$Sub_metering_2, col = "red")

lines(data$DT, data$Sub_metering_3, col = "blue")

legend("topright", pch = c(NA, NA, NA), lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex= 1, y.intersp = 1, x.intersp = 1)

dev.off()