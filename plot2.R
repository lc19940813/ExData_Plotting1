#read and process the data
library(lubridate)
setwd("F://Data Science//ื๗าต//Exploratory Data Analysis//household_power_consumption")
data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";"
                   ,stringsAsFactors = FALSE)
data$Date <- dmy(data$Date)

#subset the data
elecpower <- subset(data, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))
rm("data")
actual_time <- ymd_hms(paste(elecpower$Date, elecpower$Time)) #Use lubridate package saves a lot of typing :)

#draw the graph
#Here I used the axis() command to reset my x axis to meet the requirement of this picture
plot(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, elecpower$Global_active_power,type = "n"
     ,ylab = "Global Active Power (kilowatts)", xlab = "", axes = FALSE)
axis(1,at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2)
box()
lines(as.numeric(actual_time - ymd_hms("2007-02-01 00:00:00"))/86400, elecpower$Global_active_power)

#save my plot2.png to the working directory
dev.copy(png, "plot2.png")
dev.off()