library(data.table)

setwd("~/Dev/DataScience/ExploratyDataAnalysis/week1/ExData_Plotting1")

DOWNLOAD_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DATA_FILENAME <- "household_power_consumption.txt"

read_datasource <- function(dl_data = FALSE) {
    
    if(dl_data) {
        download.file(DOWNLOAD_URL,
              "exdata_data_household_power_consumption.zip", method="curl")
        unzip(zipfile = "exdata_data_household_power_consumption.zip")
    }
        

    # We will only be using data from the dates 1/2/2007 and 2/2/2007. 
    # One alternative is to read the data from just those dates rather than 
    # reading in the entire dataset and subsetting to those dates.

    # To achieve that the method was to identify the first line of 1/2/2007
    # and the last from 2/2/2007. In the read.table skip the first n lines
    # and read the number of rows

    # fist line 66638 : 1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000
    # last line 69517 : 2/2/2007;23:59:00;3.680;0.224;240.370;15.200;0.000;2.000;18.000
    start = 66638-1
    n_rows = 69517- start
    d <- read.table(DATA_FILENAME, 
                header = FALSE, skip = start, sep=";", nrows = n_rows, 
                col.names = c("Date","Time","Global_active_power",
                              "Global_reactive_power","Voltage","Global_intensity"
                              ,"Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                colClasses=c( "character", "character", "numeric",
                              "numeric", "numeric", "numeric",
                              "numeric", "numeric", "numeric" )
                )
    d$DateTime <- as.POSIXct(strptime(paste( d$Date, d$Time), format="%e/%m/%Y %H:%M:%S"))
    d
}
