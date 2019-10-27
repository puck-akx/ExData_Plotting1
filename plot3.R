library(dplyr)
library(lubridate)

#Reading, naming and subsetting power consumption data
consumption<- read.csv("hpc.txt", sep=";")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- filter(consumption, Date>= "2007-02-01" & Date<="2007-02-02" )
consumption$Time <- strptime(consumption$Time, format="%H:%M:%S")
consumption[1:1440,"Time"] <- format(consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
consumption[1441:2880,"Time"] <- format(consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#calling the basic plot function
plot(consumption$Time,consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#saving png file
png(file = "plot3.png")
plot(consumption$Time,consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
