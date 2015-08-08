## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
data_full <- read.table(dataFile, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec=".")

## Subsetting based on Date
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data_full)

## Converting data
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

## Constructing plot3 and saving it to a PNG file
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()