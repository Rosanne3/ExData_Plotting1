setwd("C:/Users/beuk__000/Desktop/Courses")
library(data.table)
mydata1<-fread("household_power_consumption.txt", nrows=1, header=T)
mydata2<-fread("household_power_consumption.txt",  header="auto", na.strings="?", skip="1/2/2007", nrows=2880)
mydata<- setNames(mydata2, colnames(mydata1))

mydata$Date_Time<-as.POSIXct(paste(mydata$Date,mydata$Time), format = "%d/%m/%Y %H:%M")


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(mydata$Date_Time, mydata$Global_active_power, type= "l", xlab="", 
     ylab="Global Active Power")

plot(mydata$Date_Time, mydata$Voltage, type= "l", xlab="datetime", ylab="Voltage")

plot(mydata$Date_Time, mydata$Sub_metering_1, type= "n", xlab="", 
     ylab="Energy sub metering")
lines(mydata$Date_Time, mydata$Sub_metering_1)
lines(mydata$Date_Time, mydata$Sub_metering_2, col="red")
lines(mydata$Date_Time, mydata$Sub_metering_3, col="blue")
legend("topright", pch=NA, col=c("black", "blue", "red"),
       lwd=1, lty=c(1,1,1), cex=1, bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(mydata$Date_Time, mydata$Global_reactive_power, type= "l", xlab="datetime", ylab="Global_reactive_power")


dev.off()