# plot4.R
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
subdf <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
subdf$datetime <- strptime(paste(subdf$Date, subdf$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2)) # 2行2列布局
# 左上
plot(subdf$datetime, subdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# 右上
plot(subdf$datetime, subdf$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# 左下
plot(subdf$datetime, subdf$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subdf$datetime, subdf$Sub_metering_2, col = "red")
lines(subdf$datetime, subdf$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
# 右下
plot(subdf$datetime, subdf$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
