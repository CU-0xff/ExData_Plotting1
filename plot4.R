read_data <- function()
{
  if(!exists("power_data")) {
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    power_data <<- subset(data, Date >= "2007-02-01" & Date<= "2007-02-02" )
  }
}

safe_plot_4 <- function()
{
  read_data()
  png(file = "plot4.png", width=480, height=480)
  par(mfrow = c(2,2))
  with(power_data, {
    plot(Time, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(Time, Global_active_power)
    plot(Time, Voltage, type="n", xlab="datetime", ylab="Voltage")
    lines(Time, Voltage)
    plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(Time, Sub_metering_1)
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Time, Global_reactive_power, type="n", xlab="datetime")
    lines(Time, Global_reactive_power)
  })
  
  dev.off()
}
