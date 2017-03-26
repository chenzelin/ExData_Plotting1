# Read data from the file
data <- read.csv("household_power_consumption.txt",
                 sep = ";", stringsAsFactors = FALSE)

# Reconstruct data
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
class(subset$Sub_metering_1) <- "numeric"
class(subset$Sub_metering_2) <- "numeric"
class(subset$Sub_metering_3) <- "numeric"
subset$Time <- strptime(paste(subset$Date, subset$Time),
                        format = "%d/%m/%Y %H:%M:%S")

# Plot3
Sys.setlocale("LC_TIME", "English")
with(subset, plot(Time, Sub_metering_1, type = "l",
                  ylab = "Energy sub metering", xlab = ""))
lines(subset$Time, subset$Sub_metering_2, col="Red")
lines(subset$Time, subset$Sub_metering_3, col="Blue")

# Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("Black", "Red", "Blue"))

# Generate PNG file
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()
