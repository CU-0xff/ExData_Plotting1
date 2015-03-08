read_data <- function()
{
  if(!exists("power_data")) {
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    power_data <<- subset(data, Date >= "2007-02-01" & Date<= "2007-02-02" )
  }
}

safe_plot_3 <- function()
{
  read_data()
  png(file = "plot3.png", width=480, height=480)
  plot(power_data$Time, power_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(power_data$Time, power_data$Sub_metering_1)
  lines(power_data$Time, power_data$Sub_metering_2, col="red")
  lines(power_data$Time, power_data$Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}

