## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
data_full <- read.table(dataFile, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec=".")

## Subsetting based on Date
data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data_full)

## Converting data
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data$Global_active_power)

## Constructing plot2 and saving it to a PNG file
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()