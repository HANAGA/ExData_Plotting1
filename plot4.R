
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

par(mfrow=c(2,2), mar=c(4,4,3,2))
plot(tab2$Time, tab2$Global_active_power, col="Black", type="l", ylab="Global Active Power", xlab="")
plot(tab2$Time, tab2$Voltage, col="Black", type="l", ylab="Voltage", xlab="datetime")

with(tab2,plot(Time, Sub_metering_1, type="l",col="Black", ylab="Energy Sub Metering"))
with(subset(tab2),points(Time,Sub_metering_1,type="l",col="Black"))
with(subset(tab2),points(Time,Sub_metering_2,type="l",col="Red"))
with(subset(tab2),points(Time,Sub_metering_3,type="l",col="Blue"))
legend("topright",lty=1, col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", cex=0.7)

plot(tab2$Time, tab2$Global_reactive_power, col="Black", type="l", ylab="Global Reactive Power", xlab="datetime")


dev.copy(png, file = "plot4.png")

# Close PNG device
dev.off()                                 













