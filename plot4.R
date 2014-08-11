# Read original file
org <- read.csv("./data/household_power_consumption.txt", header=T, sep=";", na.strings="?",
                stringsAsFactors=FALSE)
org$Date <- as.Date(org$Date, format="%d/%m/%Y")

# Converting DateTime Class from character
#org$datetime <- strptime(paste(org$Date, org$Time), "%m/%d/%Y %H:%M:%S")

# Create subset and remove original dataset
subs <- subset(org, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(org)

subs$datetime <- as.POSIXct(strptime(paste(as.Date(subs$Date), subs$Time), "%Y-%m-%d %H:%M:%S"))
#dt <- paste(as.Date(subs$Date), subs$Time)
#subs$datetime <- as.POSIXct(dt)

# Construct diagram
par(mfrow = c(2,2))

# Upper of the left
plot(subs$Global_active_power~subs$datetime, type="l", 
               ylab="Global Active Power", xlab="")
# Upper of the right
plot(subs$Voltage~subs$datetime, type="l", 
               ylab="Voltage", xlab="datetime")

# Bottom of the left
plot(subs$Sub_metering_1~subs$datetime, type="l", 
               ylab="Energy sub metering", xlab="")

# fig. 4
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
                    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(subs$Sub_metering_2~subs$datetime,col='Red')
lines(subs$Sub_metering_3~subs$datetime,col='Blue')
plot(subs$Global_reactive_power~subs$datetime, type="l", 
               ylab="EGlobal_reactive_powe",xlab="datetime")

# Save
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
