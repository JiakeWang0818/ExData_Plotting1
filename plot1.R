# plot1.R
# 读取数据
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
# 筛选两天
subdf <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# 绘图，保存png 480*480
png("plot1.png", width = 480, height = 480)
hist(subdf$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
