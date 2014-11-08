## Make the requested "Global Active Power" plot
## Load the data
power<-read.csv("exdata_data_household_power_consumption//household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

## Subset the data for the two dates
powersub<-power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]

## plot the histogram for the variable "Global_active_power" and set the labels and the title of the plot
hist(powersub$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

## Save this plot as a .png
## Open a .png device
png(file="plot1.png",width=480,height=480)

## Repeat the above plot
hist(powersub$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

## Close the .png device
dev.off()