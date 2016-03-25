
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

#graph Plot #2
plot(b$DateTime,b$Global_active_power,type="l", ylab="Global Active Power(kilowatts)", xlab="")
#copy graph to png file
dev.copy(png, file="plot2.png", width = 480, height = 480)
#close png device
dev.off()