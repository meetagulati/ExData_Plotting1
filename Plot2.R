

#Readdata
assignDB <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Normal Numbers
assignDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date  to filter out and graph by time of day
assignDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
assignDB <- assignDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)
dev.off()
## Plot 2
plot(x = assignDB[, dateTime]
     , y = assignDB[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

