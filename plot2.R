library(lubridate)

df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
newdf <- subset(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")

#plot2
png(file=paste(getwd(), "/plot2.png", sep=""))
t <- strptime(newdf$Time, format = "%H:%M:%S")
t <- as.POSIXct(paste(newdf$Date, newdf$Time))
plot(t,newdf$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()