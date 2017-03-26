# Read data from the file
data <- read.csv("household_power_consumption.txt",
                 sep = ";", stringsAsFactors = FALSE)

# Reconstruct data
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
class(subset$Global_active_power) <- "numeric"
subset$Time <- strptime(paste(subset$Date, subset$Time),
                        format = "%d/%m/%Y %H:%M:%S")

# Plot2
Sys.setlocale("LC_TIME", "English")
with(subset, plot(Time, Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = ""))

# Generate PNG file
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()