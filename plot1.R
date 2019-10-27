library(dplyr)

#Reading, naming and subsetting power consumption data
consumption <- read.csv("hpc.txt", sep=";")
consumption$Date <- as.Date(consumption$Date, format = c("%d/%m/%Y"))
consumption <- filter(consumption, Date>= "2007-02-01" & Date<="2007-02-02" )

#calling the basic plot function
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
hist(consumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#saving png file
png(file = "plot1.png")
hist(consumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
