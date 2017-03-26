# Read data from the file
data <- read.csv("household_power_consumption.txt",
                  sep = ";", stringsAsFactors = FALSE)

# Reconstruct data
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
class(subset$Global_active_power) <- "numeric"

# Plot1
hist(subset$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

# Generate PNG file
dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()