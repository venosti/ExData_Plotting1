## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
data_full <- read.table(dataFile, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec=".")

## Subsetting based on Date
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data_full)

## Converting data
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)


## Constructing plot4 and saving it to a PNG file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# subplot1 - Global Active Power: upper left
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# subplot2 - Voltage: upper right
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# subplot3 - Energy sub metering: lower left
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

# subplot4 - Global Reactive Power: lower right
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()