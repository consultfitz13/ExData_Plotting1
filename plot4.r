##Load data, convert Date to Date format, Time to Posixt
elec.use <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
from.date <- as.Date("02/01/2007",format="%m/%d/%Y")
to.date <- as.Date("02/02/2007",format="%m/%d/%Y")
elec.use$DateTime <- strptime(paste(elec.use$Date, elec.use$Time),format="%d/%m/%Y %H:%M:%S")
elec.use$Date <- as.Date(elec.use$Date,format="%d/%m/%Y")
elec.use.sub <- subset(elec.use, elec.use$Date == from.date | elec.use$Date == to.date)

png(filename = "plot4.png",width=480,height=480) 

par(mfrow = c(2, 2)) #2 by 2 grid

#plot 1 Global Active Power
plot(elec.use.sub$DateTime,elec.use.sub$Global_active_power,type="n",xlab=NA,ylab="Global Active Power (kilowatts)")
lines(elec.use.sub$DateTime,elec.use.sub$Global_active_power)

#plot 2 Voltage
plot(elec.use.sub$DateTime,elec.use.sub$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(elec.use.sub$DateTime,elec.use.sub$Voltage)

#plot 3 Sub metering
plot(elec.use.sub$DateTime,elec.use.sub$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=NA)
with(elec.use.sub,lines(DateTime,Sub_metering_1, col="black"))
with(elec.use.sub,lines(DateTime,Sub_metering_2, col="red"))
with(elec.use.sub,lines(DateTime,Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), lty=c(1,1), lwd=c(2.5,2.5), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4 Global ReActive Power
plot(elec.use.sub$DateTime,elec.use.sub$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(elec.use.sub$DateTime,elec.use.sub$Global_reactive_power)

dev.off()