
#place your data file in your working directory, and then run the below!

data<- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

subdata<-subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

subdata$datetime <- paste(as.Date(subdata$Date, "%d/%m/%Y"), subdata$Time)
subdata$datetime<-strptime(subdata$datetime, "%Y-%m-%d %H:%M:%S")

png('plot3.png')
par(pch=22, col="black")
plot(subdata$datetime, subdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(subdata$datetime, subdata$Sub_metering_1, type="l", col="black")
lines(subdata$datetime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()