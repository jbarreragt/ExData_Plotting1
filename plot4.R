
# Read the data
hpc <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc <- hpc[grepl("^[1|2]/2/2007", hpc$Date),]

# Convert date and time to a manageable class
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Define a layout of 2x2
par(mfrow = c(2,2))

# Create line plot
with(hpc, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Create second line plot
with(hpc, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))

# Create line plots
with(hpc, plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=""))
with(hpc, points(DateTime, Sub_metering_2, type="l", col="red"))
with(hpc, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create last line plot
with(hpc, plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

# Create and save png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


