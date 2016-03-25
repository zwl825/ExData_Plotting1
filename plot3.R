
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
 
# open png device
png(file = "plot3.png",width=480, height=480)
#graph Plot #3
plot(b$DateTime,b$Sub_metering_1,type="l",ylab = "Energy sub Metering",xlab="")
points(b$DateTime,b$Sub_metering_2,type="l",col="red")
points(b$DateTime,b$Sub_metering_3,type="l",col="blue")
#add legend
legend("topright",lty=1,col=c("black","blue","red"),legend=names(b)[7:9])
#close png device
dev.off()
