# plot3.R
# for exploratory analysis course project 1
# assume that sqldf was already installed
library(sqldf);
household <- read.csv.sql('household_power_consumption.txt', 
        sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
        header=TRUE,sep=";")
household$Date_time <- paste(household$Date, household$Time, sep=" ");
household$Date_time <-strptime(household$Date_time, format = "%d/%m/%Y %H:%M:%S");
png(file = "plot4.png");  # default size is 480x480 px
# set up plot area for 4 plots using mfrow par to fill in the row order.
par(mfrow = c(2, 2));
# plot 1
plot(household$Date_time,household$Global_active_power, type="l",xlab="",
     ylab="Global Active Power");
#plot 2
plot(household$Date_time,household$Voltage, type="l",xlab="datetime",ylab="Voltage")
# plot 3
# generate a placeholder plot with no points with  defaults changed for X/Y Axis labels, linetype
# also set up the plot canvas with sub_mtering_1 as this has the highest values
plot(household$Date_time,household$Sub_metering_1, type="n",xlab="",
     ylab="Energy Sub metering");
points(household$Date_time,household$Sub_metering_1,type="l",col="black");
points(household$Date_time,household$Sub_metering_2,type="l",col="red");
points(household$Date_time,household$Sub_metering_3,type="l",col="blue");
legend("topright", bty="n", col = c("black","red","blue"), lwd=2,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"));

#plot 4 -- to be generated
plot(household$Date_time,household$Global_reactive_power, type="l",xlab="datetime",
     ylab="Global_reactive_power");
dev.off();  # close png file