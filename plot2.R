# plot2.R
source("ExData_plotting1.R")

plot2 <- function(df) {
    plot(x = df$DateTime, y = df$Global_active_power, type="n",
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    lines( x = df$DateTime, y = df$Global_active_power )
}

# plot2.png
df_hps <- read_datasource(dl_data = FALSE)
png(filename = "plot2.png", width = 480, height = 480)
plot2(df_hps)
dev.off()
