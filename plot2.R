hpc <- read.csv2("household_power_consumption.txt")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- subset(hpc, Date >="2007-02-01" & Date <= "2007-02-02")
hpc$datetime <- strptime(with(hpc, paste(hpc$Date, hpc$Time)), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Global_intensity <- as.numeric(as.character(hpc$Global_intensity))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
hpc$Voltage <- as.numeric(as.character((hpc$Voltage)))
#%T Is equivalent to %H:%M:%S.
#hpc$Time <- strptime(hpc$Time, "%T")
#plot2.R
png(filename="plot2.png")
with(hpc,
     plot(datetime, Global_active_power,
          type = "l", ylab = "Global Active Power (kilowatts)",
          xlab = ""
     )
)
dev.off()