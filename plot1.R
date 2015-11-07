# plot1.R
source("ExData_plotting1.R")

# plot1.png
plot1 <- function(df) {
    hist(df$Global_active_power, 
        main =  "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        col = "red")
}

# download and read datasource
df_hps <- read_datasource(dl_data = FALSE)
png(filename = "plot1.png", width = 480, height = 480)
plot1(df_hps)
dev.off()