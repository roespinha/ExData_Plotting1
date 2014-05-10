

# Read data
d <- read.table(file.path(getwd(), "household_power_consumption.txt"), sep = ";", header = TRUE)
d2 <- subset(d, as.Date(d$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(d$Date, "%d/%m/%Y") == "2007-02-02")
rm(d)

date_times <- with(d2, strptime(paste(as.Date(Date, "%d/%m/%Y"), Time), "%Y-%m-%d %H:%M:%S"))
ga <- with(d2, as.numeric(levels(Global_active_power))[Global_active_power])
gr <- with(d2, as.numeric(levels(Global_reactive_power))[Global_reactive_power])
m1 <- with(d2, as.numeric(levels(Sub_metering_1))[Sub_metering_1])
m2 <- with(d2, as.numeric(levels(Sub_metering_2))[Sub_metering_2])
m3 <- with(d2, Sub_metering_3)
v <- with(d2, as.numeric(levels(Voltage))[Voltage])

# Plot data
png(filename = "plot4.png", width = 480, height = 480, bg = "white")

par(mfrow = c(2,2))

# plot (top left)
plot(date_times, ga, type = "l", xlab = "", ylab = "Global Active Power")

# plot (top right)
plot(date_times, v, type = "l", xlab = "datetime", ylab = "Voltage")

# plot (bottom left)
plot(date_times, m1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(date_times, m2, col = "red")
lines(date_times, m3, col = "blue")
legend("topright", pch = c(NA, NA, NA), lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (bottom right)
plot(date_times, gr, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
