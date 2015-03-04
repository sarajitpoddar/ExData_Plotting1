#----------------------------------------------------
# Plot 1
#----------------------------------------------------

# Load data
source("readdata.R")

# Import thd datafile if data does not exist
if (!exists("powerdata")) {powerdata <- readdata()}

# Open png device
png(filename="../plots/plot1.png", width=480, height=480)

# Plot the data
hist(powerdata$Global_active_power, 
     main= "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     col= "red")

# Turn off device
dev.off()