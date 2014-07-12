##Load data, convert Date to Date format, Time to Posixt
elec.use <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
from.date <- as.Date("02/01/2007",format="%m/%d/%Y")
to.date <- as.Date("02/02/2007",format="%m/%d/%Y")
elec.use$DateTime <- strptime(paste(elec.use$Date, elec.use$Time),format="%d/%m/%Y %H:%M:%S")
elec.use$Date <- as.Date(elec.use$Date,format="%d/%m/%Y")
elec.use.sub <- subset(elec.use, elec.use$Date == from.date | elec.use$Date == to.date)


#Create Plot to png file
png(filename = "plot2.png",width=480,height=480) 
plot(elec.use.sub$DateTime,elec.use.sub$Global_active_power,type="n",xlab=NA,ylab="Global Active Power (kilowatts)")
lines(elec.use.sub$DateTime,elec.use.sub$Global_active_power)
dev.off()