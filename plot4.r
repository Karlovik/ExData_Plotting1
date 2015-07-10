graphics.off()
electric=read.table("household_power_consumption.txt",sep=";",head=TRUE)

electric$Date=as.Date(strptime(electric$Date,format="%d/%m/%Y"))
electricity=subset(electric,electric$Date>="2007-02-01"&electric$Date<="2007-02-02")
electricity$Global_active_power=as.numeric(as.character(electricity$Global_active_power))
electricity$Date=paste(as.character(electricity$Date)," ",as.character(electricity$Time))
electricity$Date=strptime(electricity$Date, format="%Y-%m-%d  %H:%M:%S")
electricity$Sub_metering_1=as.numeric(as.character(electricity$Sub_metering_1))
electricity$Sub_metering_2=as.numeric(as.character(electricity$Sub_metering_2))
electricity$Sub_metering_3=as.numeric(as.character(electricity$Sub_metering_3))
electricity$Voltage=as.numeric(as.character(electricity$Voltage))
electricity$Global_reactive_power=as.numeric(as.character(electricity$Global_reactive_power))


png(filename = "plot4.png",width=480,height=480,unit="px")
par(bg="white")

par(mfcol=c(2,2))

plot(electricity$Date,electricity$Global_active_power,type='l',ylab="Global Active Power (kilowats)",xlab="")
plot(electricity$Date,electricity$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(electricity$Date,electricity$Sub_metering_3,col="blue")
lines(electricity$Date,electricity$Sub_metering_2,col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
plot(electricity$Date,electricity$Voltage,type='l',xlab="datetime",ylab="Voltage")
plot(electricity$Date,electricity$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()
graphics.off()
