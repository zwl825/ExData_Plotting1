
#Download data to working directory

#read in data 
a<-read.csv2("exdata-data-household_power_consumption/household_power_consumption.txt",na.strings = "?")
#subset with the required dates
b <-a[a$Date=="1/2/2007" | a$Date=="2/2/2007",]
#rm large data from memory
rm(a)
#add new col DateTime, convert to date format
b$DateTime<- strptime(paste(b$Date,b$Time), "%d/%m/%Y %H:%M:%OS")
#transform text to numeric
b$Global_active_power<-as.numeric(as.character(as.factor(b$Global_active_power)))
b$Sub_metering_1 <-as.numeric(as.character(as.factor(b$Sub_metering_1)))
b$Sub_metering_2 <-as.numeric(as.character(as.factor(b$Sub_metering_2)))
b$Sub_metering_3 <-as.numeric(as.character(as.factor(b$Sub_metering_3)))
b$Voltage  <-as.numeric(as.character(as.factor(b$Voltage)))
b$Global_reactive_power <-as.numeric(as.character(as.factor(b$Global_reactive_power)))

# open png device
png(file = "plot4.png",width=480, height=480)
par(mfrow=c(2,2))
#graph Plot #4
#top left
plot(b$DateTime,b$Global_active_power,type="l", ylab="Global Active Power", xlab="")
#top right
plot(b$DateTime,b$Voltage,type="l", ylab="Voltage", xlab="datetime")
#bottom left

plot(b$DateTime,b$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
points(b$DateTime,b$Sub_metering_2,type="l",col="red")
points(b$DateTime,b$Sub_metering_3,type="l",col="blue")
#add legend
legend("topright",lty=1,col=c("black","blue","red"),legend=names(b)[7:9],bty = "n",cex = 0.75)

#bottom right
plot(b$DateTime,b$Global_reactive_power ,type="l", ylab="Global_reactive_power", xlab="datetime")

#close png device
dev.off()
