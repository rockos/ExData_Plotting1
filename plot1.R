#x <- read.table("household_power_consumption.txt", header=T, sep=";")
x <- read.table("./data/plot_data.txt", header=F,sep=";", stringsAsFactors=FALSE) 
hd <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(x) <- hd

# Converting DateTime Class from character
x$datetime <- strptime(paste(x$Date,x$Time), "%m/%d/%Y %H:%M:%S")

#Construct diagram
hist(x$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
