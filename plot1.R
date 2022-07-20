library(lubridate)

df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
newdf <- subset(df, df$Date >= "2007-02-01" & df$Date <= "2007-02-02")

#plot1
png(file=paste(getwd(), "/plot1.png", sep=""))
hist(as.numeric(newdf$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()