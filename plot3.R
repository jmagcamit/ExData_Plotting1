library(lubridate)

df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
newdf <- subset(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
t <- strptime(newdf$Time, format = "%H:%M:%S")
t <- as.POSIXct(paste(newdf$Date, newdf$Time))

#plot3
png(file=paste(getwd(), "/plot3.png", sep=""))
plot(t, newdf$Sub_metering_1, type = "l", xlab = "", ylab="Energy Sub-Metering")
lines(t, newdf$Sub_metering_2, type = "l", col="blue")
lines(t, newdf$Sub_metering_3, type = "l", col="red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1)
dev.off()