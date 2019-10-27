library(dplyr)
library(lubridate)

#Reading, naming and subsetting power consumption data
consumption<- read.csv("hpc.txt", sep=";")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption<- filter(consumption, Date>= "2007-02-01" & Date<="2007-02-02" )
consumption$Time <- strptime(consumption$Time, format="%H:%M:%S")
consumption[1:1440,"Time"] <- format(consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
consumption[1441:2880,"Time"] <- format(consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#calling the basic plot function
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
plot(consumption$Time, consumption$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#saving png file
png(file = "plot2.png")
plot(consumption$Time, consumption$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
