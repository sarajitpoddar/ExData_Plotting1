#----------------------------------------------------
# Plot 2
#----------------------------------------------------

# Load data
source("readdata.R")

# Import thd datafile if data does not exist
if (!exists("powerdata")) {powerdata <- readdata()}

# Open png device
png(filename="../plots/plot2.png", width=480, height=480)

# Plot the data
plot(powerdata$DateTime, 
     powerdata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Turn off device
dev.off()