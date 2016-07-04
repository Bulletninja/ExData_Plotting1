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
#plot4.R
png(filename="plot4.png")
par(mfrow=c(2,2))
#par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(hpc, {
        #plot1
        plot(datetime, Global_active_power,
             type = "l", ylab = "Global Active Power",
             xlab = ""
        )
        #plot2
        plot(datetime, Voltage,
             type = "l"
        )
        #plot3
        plot(datetime, Sub_metering_1, type = "l",
             ylab = "Energy sub metering",
             xlab = ""
        )
        legend("topright", lty=1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty='n'
        )
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        #plot4
        plot(datetime, Global_reactive_power,
             type = "l"
        )
})
dev.off()
