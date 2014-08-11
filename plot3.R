# Read original file
org <- read.csv("./data/household_power_consumption.txt", header=T, sep=";", na.strings="?",
                stringsAsFactors=FALSE)
org$Date <- as.Date(org$Date, format="%d/%m/%Y")

# Converting DateTime Class from character
#org$datetime <- strptime(paste(org$Date, org$Time), "%m/%d/%Y %H:%M:%S")

# Create subset and remove original dataset
subs <- subset(org, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(org)

subs$datetime <- as.POSIXct(strptime(paste(subs$Date, subs$Time), "%Y-%m-%d %H:%M:%S"))

# Construct diagram
with(subs, {
         plot(Sub_metering_1~datetime, type="l",
                       ylab="Global Active Power (kilowatts)", xlab="")
             lines(Sub_metering_2~datetime,col='Red')
             lines(Sub_metering_3~datetime,col='Blue')
                })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Save
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
