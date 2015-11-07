# plot3.R
source("ExData_plotting1.R")

plot3 <- function(df) {

    # The plot is compose by the 3 differents sub_metering_X dataset
    # so the plot function needs to get for x and y 
    # the concatenated dataset of sub_metering_X and together with it
    # three time the date datasets (otherwise it complated because x
    # and y don't have the same length).
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
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

df_hps <- read_datasource(dl_data = FALSE)
png(filename = "plot3.png", width = 480, height = 480)
plot3(df_hps)
dev.off()