#----------------------------------------------------
# Plot 3
#----------------------------------------------------

# Load data
source("readdata.R")

# Import thd datafile if data does not exist
if (!exists("powerdata")) {powerdata <- readdata()}


# Open png device
png(filename="../plots/plot3.png", width=480, height=480)

# Plot the data
plot(powerdata$DateTime, 
     powerdata$Sub_metering_1, 
     type="l",
     xlab="", 
     ylab="Energy sub metering")

lines(powerdata$DateTime, powerdata$Sub_metering_2, col="red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty="solid")


# Turn off device
dev.off()