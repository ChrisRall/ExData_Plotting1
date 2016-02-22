#place your data file in your working directory, and then run the below!

data<- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

subdata<-subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

subdata$datetime <- paste(as.Date(subdata$Date, "%d/%m/%Y"), subdata$Time)
subdata$datetime<-strptime(subdata$datetime, "%Y-%m-%d %H:%M:%S")

png('plot2.png')
par(pch=22, col="black")
plot(subdata$datetime, subdata$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(subdata$datetime, subdata$Global_active_power, type="l")
dev.off()