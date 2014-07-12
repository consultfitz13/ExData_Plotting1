##Load data, convert Date to Date format, Time to Posixt
elec.use <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
elec.use$Date <- as.Date(elec.use$Date,format='%d/%m/%Y') 
elec.use$Time <- strptime(elec.use$Time,format='%H:%M:%S') 
from.date <- as.Date("02/01/2007",format='%m/%d/%Y')
to.date <- as.Date("02/02/2007",format='%m/%d/%Y')
elec.use.sub <- subset(elec.use, Date == from.date | Date == to.date )

#Create Plot to png file
png(filename = "plot1.png",width=480,height=480) 
hist(elec.use.sub$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power",col="red",axes=FALSE)
axis(1) 
axis(2, at=c(0,200,400,600,800,1000,1200))
dev.off()
