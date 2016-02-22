#place your data file in your working directory, and then run the below!

data<- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

subdata<-subset(data, data$Date %in% c("1/2/2007", "2/2/2007")) 
png('plot1.png')
hist(as.numeric(subdata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()