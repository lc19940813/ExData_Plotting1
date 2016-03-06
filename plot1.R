#read and process the data
library(lubridate)
setwd("F://Data Science//ื๗าต//Exploratory Data Analysis//household_power_consumption")
data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";"
                   ,stringsAsFactors = FALSE)
data$Date <- dmy(data$Date)

#subset the data
elecpower <- subset(data, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))
rm("data") #free memory

#draw a histogram according to the given sample
hist(as.numeric(elecpower$Global_active_power)
     , col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#save my plot1.png to the working directory
dev.copy(png, "plot1.png")
dev.off()