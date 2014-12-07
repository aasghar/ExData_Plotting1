#Plot 1

#read data table
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("NA", "-", "?"))

# convert Date column to POSIXlt type
data$Date <- strptime(data$Date, "%d/%m/%Y")

# only select dates that need to be analyzed
data <- subset(data, data$Date == "2007-02-01" | data$Date =="2007-02-02")

# convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot directly png file
png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red", breaks = 20,
     ylim = c(0, 1200), cex.lab = 1, cex.axis = 0.9)

dev.off()
