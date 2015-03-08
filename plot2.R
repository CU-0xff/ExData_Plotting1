read_data <- function()
{
  if(!exists("power_data")) {
    data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    power_data <<- subset(data, Date >= "2007-02-01" & Date<= "2007-02-02" )
  }
}


safe_plot_2 <- function()
{
  read_data()
  png(file = "plot2.png", width=480, height=480)
  plot(power_data$Time, power_data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(power_data$Time, power_data$Global_active_power)
  dev.off()
}

