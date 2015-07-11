graphics.off()
electric=read.table("household_power_consumption.txt",sep=";",head=TRUE)

electric$Date=as.Date(strptime(electric$Date,format="%d/%m/%Y"))
electricity=subset(electric,electric$Date>="2007-02-01"&electric$Date<="2007-02-02")
electricity$Date=paste(as.character(electricity$Date)," ",as.character(electricity$Time))
electricity$Date=strptime(electricity$Date, format="%Y-%m-%d  %H:%M:%S")

electricity$Sub_metering_1=as.numeric(as.character(electricity$Sub_metering_1))
electricity$Sub_metering_2=as.numeric(as.character(electricity$Sub_metering_2))
electricity$Sub_metering_3=as.numeric(as.character(electricity$Sub_metering_3))

png(filename = "plot3.png",width=480,height=480,unit="px")
par(bg="white")

plot(electricity$Date,electricity$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(electricity$Date,electricity$Sub_metering_3,col="blue")
lines(electricity$Date,electricity$Sub_metering_2,col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#dev.copy(png, filename = "plot3.png",width=480,height=480,unit="px")
dev.off()
graphics.off()
