#----------------------------------------------------
# Plot 4
#----------------------------------------------------

# Load data
source("readdata.R")

# Import thd datafile if data does not exist
if (!exists("powerdata")) {powerdata <- readdata()}

# Open png device
png(filename="../plots/plot4.png", width=480, height=480)

# Plot the data into 2 by 2 matrix
par(mfrow=c(2,2))

## Top left plot
plot(type="l",
     powerdata$DateTime, 
     powerdata$Global_active_power,
     xlab="",
     ylab="Global Active Power" )

## Top right plot
plot(type="l",
     powerdata$DateTime, 
     powerdata$Voltage,
     xlab="datetime", 
     ylab="Voltage", )

## Bottom left
plot(type="l",
     powerdata$DateTime, 
     powerdata$Sub_metering_1,
     xlab="", 
     ylab="Energy sub metering")

lines(powerdata$DateTime, powerdata$Sub_metering_2, col="red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty="solid", bty="n")

## Bottom right
plot(type="l",
     powerdata$DateTime, 
     powerdata$Global_reactive_power,
     xlab="datetime", 
     ylab="Global_reactive_power")

# Turn off device
dev.off()