
# Read the data
hpc <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc <- hpc[grepl("^[1|2]/2/2007", hpc$Date),]

# Create histogram
hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Create and save png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()