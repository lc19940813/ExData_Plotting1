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

#draw the graph
#Here I used the axis() command to reset my x axis to meet the requirement of this picture
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
       lty =c(1,1,1), cex = .5) # In order to reduce the size of the legend, I set the character expansion factor as 0.5

#save my plot3.png to the working directory
dev.copy(png, "plot3.png")
dev.off()
