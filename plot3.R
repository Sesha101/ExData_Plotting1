# plot3.R
# for exploratory analysis course project 1
# assume that sqldf was already installed
library(sqldf);
household <- read.csv.sql('household_power_consumption.txt', 
        sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
        header=TRUE,sep=";")
household$Date_time <- paste(household$Date, household$Time, sep=" ");
household$Date_time <-strptime(household$Date_time, format = "%d/%m/%Y %H:%M:%S");
png(file = "plot3.png");  # default size is 480x480 px
# generate a placeholder plot with no points with  defaults changed for X/Y Axis labels, linetype
# also set up the plot canvas with sub_mtering_1 as this has the highest values
plot(household$Date_time,household$Sub_metering_1, type="n",xlab="",
     ylab="Energy Sub metering");
points(household$Date_time,household$Sub_metering_1,type="l",col="black");
points(household$Date_time,household$Sub_metering_2,type="l",col="red");
points(household$Date_time,household$Sub_metering_3,type="l",col="blue");
legend("topright", col = c("black","red","blue"), lwd=2,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"));
dev.off();  # close png file