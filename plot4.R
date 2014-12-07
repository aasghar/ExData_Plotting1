#plot 4
# read data table
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))

# combine Date and time column and convert to POSIXlt type
data$DT <- paste(data$Date, data$Time, sep = " ")
data$DT <- strptime(data$DT, "%d/%m/%Y %T")

# convert Date column to POSIXlt type
data$Date <- strptime(data$Date, "%d/%m/%Y")

# # only select dates that need to be analyzed
data <- subset(data, data$Date == "2007-02-01" | data$Date =="2007-02-02")

# convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot directly to png file
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
# plot on top left
plot(data$DT, data$Global_active_power, type ="l", 
     xlab = "", ylab = "Global Active Power")

# plot on top right

plot(data$DT, data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

# plot on bottom left

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
