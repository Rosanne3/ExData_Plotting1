setwd("C:/Users/beuk__000/Desktop/Courses")
library(data.table)
mydata1<-fread("household_power_consumption.txt", nrows=1, header=T)
mydata2<-fread("household_power_consumption.txt",  header="auto", na.strings="?", skip="1/2/2007", nrows=2880)
mydata<- setNames(mydata2, colnames(mydata1))

mydata$Date_Time<-as.POSIXct(paste(mydata$Date,mydata$Time), format = "%d/%m/%Y %H:%M")


png("plot3.png", width = 480, height = 480)

plot(mydata$Date_Time, mydata$Sub_metering_1, type= "n", xlab="", 
     ylab="Energy sub metering")
lines(mydata$Date_Time, mydata$Sub_metering_1)
lines(mydata$Date_Time, mydata$Sub_metering_2, col="red")
lines(mydata$Date_Time, mydata$Sub_metering_3, col="blue")
legend("topright", pch=NA, col=c("black", "blue", "red"),
       lwd=1, lty=c(1,1,1), cex=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()