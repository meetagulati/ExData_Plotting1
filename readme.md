Plot 1.R

library("data.table")

#Reads data
assignDB <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )

# Print Hist in numbers
assignDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
assignDB[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
assignDB <- assignDB[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(assignDB[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


Plot 2.R



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



     PLot 3.R

     #Reads data
assignDB <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# NOrmal Numbers
assignDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date to filter and graph by time of day
assignDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
assignDB <- assignDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(assignDB[, dateTime], assignDB[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(assignDB[, dateTime], assignDB[, Sub_metering_2],col="red")
lines(assignDB[, dateTime], assignDB[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()


PLot 4.R


#Reads data
assignDB <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Normal 
assignDB[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
assignDB[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
assignDB <- assignDB[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(assignDB[, dateTime], assignDB[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(assignDB[, dateTime],assignDB[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(assignDB[, dateTime], assignDB[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(assignDB[, dateTime], assignDB[, Sub_metering_2], col="red")
lines(assignDB[, dateTime], assignDB[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(assignDB[, dateTime], assignDB[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()