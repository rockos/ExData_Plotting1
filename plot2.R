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
plot(subs$Global_active_power~subs$datetime, main="Global Active Power",
     xlab="", ylab="Global Active Power (kilowatts)", type="l")

# Save
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
