#Plot 2

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))

data$DT <- paste(data$Date, data$Time, sep = " ")
data$DT <- strptime(data$DT, "%d/%m/%Y %T")

data$Date <- strptime(data$Date, "%d/%m/%Y")

data <- subset(data, data$Date == "2007-02-01" | data$Date =="2007-02-02")

data$Global_active_power <- as.numeric(data$Global_active_power)


png(filename = "plot2.png", width = 480, height = 480)
plot(data$DT, data$Global_active_power, type ="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab = 0.75, 
     cex.axis = 0.75)

dev.off()
