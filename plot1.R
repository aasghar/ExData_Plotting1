#Plot 1

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))

##data$DT <- paste(data$Date, data$Time, sep = " ")
##data$DT <- strptime(data$DT, "%d/%m/%Y %T")

data$Date <- strptime(data$Date, "%d/%m/%Y")


data <- subset(data, data$Date == "2007-02-01" | data$Date =="2007-02-02")


data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red", breaks = 20,
     ylim = c(0, 1200), cex.lab = 1, cex.axis = 0.9)

dev.off()
