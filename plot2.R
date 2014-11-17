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
Sys.setlocale(category="LC_TIME",locale="en_US")

## Plot the variable "Global_active_power" over the time and set the labels and the title of the plot
plot(datetime,powersub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Save this plot as a .png
dev.copy(png,file="plot2.png",width=480,height=480)

## Close the .png device
dev.off()
