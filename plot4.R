library(dplyr)
library(lubridate)

#Reading, naming and subsetting power consumption data
consumption<- read.csv("hpc.txt", sep=";")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- filter(consumption, Date>= "2007-02-01" & Date<="2007-02-02" )
consumption$Time <- strptime(consumption$Time, format="%H:%M:%S")
consumption[1:1440,"Time"] <- format(consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
consumption[1441:2880,"Time"] <- format(consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# initiating a composite plot with many graphs
par(mfrow=c(2,2), mar=c(4.5,4.5,2,2))

#calling the basic plot function
with(consumption,{
  plot(consumption$Time,as.numeric(as.character(consumption$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(consumption$Time,as.numeric(as.character(consumption$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(consumption$Time,consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(consumption$Time,as.numeric(as.character(consumption$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#saving png file
png(file = "plot4.png")
par(mfrow=c(2,2), mar=c(4.5,4.5,2,2))
with(consumption,{
  plot(consumption$Time,as.numeric(as.character(consumption$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(consumption$Time,as.numeric(as.character(consumption$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(consumption$Time,consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(consumption$Time,as.numeric(as.character(consumption$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
