# plot4.R

source("ExData_plotting1.R")

plot4 <- function(df) {

    par(mfrow = c(2, 2))
    # top left 
    # reuse existing plot2 function
    plot(x = df$DateTime, y = df$Global_active_power, type="n",
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    lines( x = df$DateTime, y = df$Global_active_power )
    
    # top right
    plot(x = df$DateTime, y = df$Voltage, type="n",
         ylab = "Voltage",
         xlab = "datetime")
    lines( x = df$DateTime, y = df$Voltage )
    
    # bottom left
    sub_metering = c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3)
    sub_date = c(df$DateTime,df$DateTime,df$DateTime)
    plot(x = sub_date, y = sub_metering, type="n",
         ylab = "Energy sub metering",
         xlab = "")
    lines( x = df$DateTime, y = df$Sub_metering_1, col = "black" )
    lines( x = df$DateTime, y = df$Sub_metering_2, col = "red" )
    lines( x = df$DateTime, y = df$Sub_metering_3, col = "blue" )
    legend("topright", col = c( "black", "red", "blue"), 
           lty=c(1,1,1),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n")

    # bottom right
    plot(x = df$DateTime, y = df$Global_reactive_power, type="n",
         ylab = "Global_reactive_power",
         xlab = "datetime")
    lines( x = df$DateTime, y = df$Global_reactive_power )
}

df_hps <- read_datasource(dl_data = FALSE)
png(filename = "plot4.png", width = 480, height = 480)
plot4(df_hps)
dev.off()