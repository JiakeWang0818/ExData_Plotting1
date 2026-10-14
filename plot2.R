# plot2.R
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
subdf <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
# 合并日期时间
subdf$datetime <- strptime(paste(subdf$Date, subdf$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(subdf$datetime, subdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
