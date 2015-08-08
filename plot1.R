## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
data_full <- read.table(dataFile, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec=".")
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

## Subsetting based on Date
data <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(data_full)
globalActivePower <- as.numeric(data$Global_active_power)

## Constructing plot1 and saving it to a PNG file
png("plot1.png", width=480, height=480)
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

