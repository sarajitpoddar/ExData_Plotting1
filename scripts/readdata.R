#----------------------------------------------------
# Read and filter datafile
#----------------------------------------------------
readdata <- function() {
        
        # Include required library
        require(lubridate) || install.packages("lubridate")
        require(dplyr) || install.packages("dplyr")
        
        # For processing data in the data dir and returning back to scripts dir
        workdir  <- getwd()
        datapath <- "../data"
        
        # Setting data dir as the working dir
        setwd(datapath)
        
        # Filename of the file to be imported
        zipfilename <- "exdata_data_household_power_consumption.zip"
        txtfilename <- unzip(zipfilename)
        
        
        # Read the entire data into powerdata table
        powerdata <- read.table(txtfilename, header=TRUE, sep=';', 
                                na.strings='?',
                                stringsAsFactors = FALSE)
        
        # Return to scripts dir
        setwd(workdir)
        
        # Convert dates and times
        powerdata <- mutate(powerdata, Date = dmy(Date))
        
        # Retain the data that is needed for the plot
        sdate <- ymd('2007-02-01')
        edate <- ymd('2007-02-02')
        
        # Filter data for date 
        powerdata <- filter(powerdata, Date == sdate | Date == edate)
        
        # Convert Time
        powerdata <- mutate(powerdata, Time = hms(Time))
        
        # Combine date and time
        powerdata <- mutate(powerdata, DateTime = Date + Time)
        
        # The data table is returned to be used in the plots
        return(powerdata)
}
