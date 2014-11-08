## Make the requested "Global Active Power" plot
## Load the data
power<-read.csv("exdata_data_household_power_consumption//household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

## Subset the data for the two dates
powersub<-power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

## Make a datestamp by concatenating the two variables date+time
datetime<-paste(powersub$Date,powersub$Time)

## Make this a variable of class Date/Time
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")

## Set the locale for plotting the correct day names
Sys.setlocale(category="LC_TIME",locale="US")

## Prepare the 2x2 plot canvas
par(mfrow=c(2,2))

## Reduce the font size
par(ps=11,cex=.9)

## (1,1) Plot the variable "Global_active_power" over the time and set the labels and the title of the plot
plot(datetime,powersub$Global_active_power,type="l",xlab="",ylab="Global Active Power")

## (1,2) Plot the Voltage over the datetime variable
plot(datetime,powersub$Voltage,type="l",ylab="Voltage")

## (2,1) Plot the variable "Global_active_power" over the time and set the labels and the title of the plot
plot(datetime,powersub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(datetime,powersub$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(datetime,powersub$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue")

## Add the legend
legend("top",lty=1,col=c("black","red","blue"),leg.txt,bty="n")

## (2,2) Plot the Global_reactive_power variable versus the datetime
plot(datetime,powersub$Global_reactive_power,type="l",ylab="Global_reactive_power")

## Save this plot as a .png
dev.copy(png,file="plot4.png",width=504,height=504)

## Close the .png device
dev.off()
