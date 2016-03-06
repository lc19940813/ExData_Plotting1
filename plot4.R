#read and process the data
library(lubridate)
setwd("F://Data Science//ื๗าต//Exploratory Data Analysis//household_power_consumption")
data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";"
                   ,stringsAsFactors = FALSE)
data$Date <- dmy(data$Date)

#subset the data
elecpower <- subset(data, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))
rm("data")
actual_time <- ymd_hms(paste(elecpower$Date, elecpower$Time))
sub_meter1 <- elecpower$Sub_metering_1
sub_meter2 <- elecpower$Sub_metering_2
sub_meter3 <- elecpower$Sub_metering_3
Voltage <- elecpower$Voltage
Global_rea_pow <- elecpower$Global_reactive_power
Global_act_pow <- elecpower$Global_active_power

#set the global setting of my graphs
par(mfrow = c(2,2))

#draw the graphs

#1
plot(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, Global_act_pow,type = "n"
     ,ylab = "Global Active Power", xlab = "", axes = FALSE)
axis(1,at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, Global_act_pow)

#2
plot(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, Voltage,type = "n"
     ,ylab = "Voltage", xlab = "datetime", axes = FALSE)
axis(1,at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, Voltage)

#3
plot(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, sub_meter1,type = "n"
     ,ylab = "Energy sub metering", xlab = "", axes = FALSE)
axis(1,at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, sub_meter1
)
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, sub_meter2
      , col = "red")
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, sub_meter3
      , col = "blue")
legend("topright",col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty =c(1,1,1), cex = 0.5, bty = "n" ) # bty = "n" allows us to make the border of the legend disappear.

#4
plot(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, Global_rea_pow,type = "n"
     ,ylab = "Global_reactive_power", xlab = "datetime", axes = FALSE)
axis(1,at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, Global_rea_pow)

#save my plot4.png to the working directory
dev.copy(png, "plot4.png")
dev.off()
