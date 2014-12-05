setwd("C:/Users/beuk__000/Desktop/Courses")
library(data.table)
mydata1<-fread("household_power_consumption.txt", nrows=1, header=T)
mydata2<-fread("household_power_consumption.txt",  header="auto", na.strings="?", skip="1/2/2007", nrows=2880)
mydata<- setNames(mydata2, colnames(mydata1))

mydata$Date_Time<-as.POSIXct(paste(mydata$Date,mydata$Time), format = "%d/%m/%Y %H:%M")


png("plot1.png", width = 480, height = 480)

hist(mydata$Global_active_power, col= "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

png("plot2.png", width = 480, height = 480)