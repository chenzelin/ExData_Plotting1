# Read data from the file
data <- read.csv("household_power_consumption.txt",
                 sep = ";", stringsAsFactors = FALSE)

# Reconstruct data
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
class(subset$Global_active_power) <- "numeric"
class(subset$Voltage) <- "numeric"
class(subset$Sub_metering_1) <- "numeric"
class(subset$Sub_metering_2) <- "numeric"
class(subset$Sub_metering_3) <- "numeric"
class(subset$Global_reactive_power) <- "numeric"
subset$Time <- strptime(paste(subset$Date, subset$Time),
                        format = "%d/%m/%Y %H:%M:%S")

# Plot4
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(2, 2))

# Topleft
with(subset, plot(Time, Global_active_power, type = "l",
                  ylab = "Global Active Power", xlab = ""))

# Topright
with(subset, plot(Time, Voltage, type = "l", xlab = "datetime"))

# Bottomleft
with(subset, plot(Time, Sub_metering_1, type = "l",
                  ylab = "Energy sub metering", xlab = ""))
lines(subset$Time, subset$Sub_metering_2, col="Red")
lines(subset$Time, subset$Sub_metering_3, col="Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("Black", "Red", "Blue"), cex = 0.9, bty = "n")

# Bottomright
with(subset, plot(Time, Global_reactive_power, type = "l",
                  ylab = "Global Reactive Power", xlab = "datetime"))

# Generate PNG file
dev.copy(png,'plot4.png',  width = 480, height = 480)
dev.off()