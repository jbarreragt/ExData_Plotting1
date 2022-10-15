
# Read the data
hpc <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc <- hpc[grepl("^[1|2]/2/2007", hpc$Date),]

# Convert date and time to a manageable class
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Create line plot
with(hpc, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Create and save png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()