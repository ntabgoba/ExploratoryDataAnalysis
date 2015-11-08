rm(list=ls())
# Set Working Directory Load data 
setwd("C:/Users/Jiovani/Desktop/Exploratory_Data_Analysis")
energy_data <- read.table("C:/Users/Jiovani/Desktop/cda/household_power_consumption.txt", sep = ";" , na.strings="?", header=TRUE)

# Format Data column
energy_data$Date <- as.Date(energy_data$Date, format="%d/%m/%Y")

# Subset the dates 2007-02-01 and 2007-02-02
energy_data <- subset(energy_data, energy_data$Date >= as.Date("2007-02-01") )
energy_data <- subset(energy_data, energy_data$Date <= as.Date("2007-02-02") )

# Energy Time, Day + Hour
energy_data$Time<-paste(energy_data$Date,energy_data$Time,sep="")
energy_data$Time<-strptime(energy_data$Time,format = "%Y-%m-%d %H:%M:%S")


# 4th plot
png("plot4.png",width=480, height=480, units="px")
par(mfrow=c(2,2))
#c (1,1)
plot(energy_data$Time,energy_data$Global_active_power, type="l", ylab="Global Active Power (kilowats)", xlab="")

#c (1,2)
plot(energy_data$Time,energy_data$Voltage, type="l", ylab="Global Active Power (kilowats)", xlab="datetime")

#c (2,1)
plot(energy_data$Time,energy_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=energy_data$Time,y=energy_data$Sub_metering_1,lty="solid")
lines(x=energy_data$Time,y=energy_data$Sub_metering_2,lty="solid", col="red")
lines(x=energy_data$Time,y=energy_data$Sub_metering_3,lty="solid", col="blue")
legend("topright",lty = "solid", col = c("black","blue", "red"), legend=c("Sub_metering1", "Sub_metering2", "Sub_metering3"))

#c (2,2)
plot(energy_data$Time,energy_data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()