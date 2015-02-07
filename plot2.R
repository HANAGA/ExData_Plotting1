
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power.zip")
unzip("power.zip", exdir="power")

tab1 <- read.table("power/household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE, na.strings="?")


tab1$Time = paste(tab1$Date, tab1$Time)

tab1$Date <- as.Date(tab1$Date,"%d/%m/%Y")
tab1$Time <- strptime(tab1$Time,format="%d/%m/%Y %H:%M:%S")


tab2 <- tab1[ tab1$Date == as.Date("2007-02-01") | tab1$Date == as.Date("2007-02-02"),]


# start screen device in Windows
windows()                
with(tab2,plot(tab2$Time, tab2$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)", main=""))

dev.copy(png, file = "plot2.png")

# Close PNG device
dev.off()                                 


