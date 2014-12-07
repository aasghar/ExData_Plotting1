#Plot 2

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
png(filename = "plot2.png", width = 480, height = 480)
plot(data$DT, data$Global_active_power, type ="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab = 1, 
     cex.axis = 0.9)

dev.off()
