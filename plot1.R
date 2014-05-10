

# Read data
d <- read.table(file.path(getwd(), "household_power_consumption.txt"), sep = ";", header = TRUE)
d2 <- subset(d, as.Date(d$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(d$Date, "%d/%m/%Y") == "2007-02-02")
rm(d)

date_times <- with(d2, strptime(paste(as.Date(Date, "%d/%m/%Y"), Time), "%Y-%m-%d %H:%M:%S"))
ga <- with(d2, as.numeric(levels(Global_active_power))[Global_active_power])

# Plot data
png(filename = "plot1.png", width = 480, height = 480, bg = "white")

# plot 1
with(d2, hist(ga, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))

dev.off()
