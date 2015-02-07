
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

with(tab2,plot(Time, Sub_metering_1, type="l",col="Black", ylab="Energy Sub Metering"))
with(subset(tab2),points(Time,Sub_metering_1,type="l",col="Black"))
with(subset(tab2),points(Time,Sub_metering_2,type="l",col="Red"))
with(subset(tab2),points(Time,Sub_metering_3,type="l",col="Blue"))
legend("topright",lty=1, col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")

# Close PNG device
dev.off()                                 













