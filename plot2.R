# plot2.R
# for exploratory analysis course project 1
# assume that sqldf was already installed
library(sqldf);
household <- read.csv.sql('household_power_consumption.txt',
    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
    header=TRUE,sep=";")
household$Date_time <- paste(household$Date, household$Time, sep=" ");
household$Date_time <-strptime(household$Date_time, format = "%d/%m/%Y %H:%M:%S");
png(file = "plot2.png");  # default size is 480x480 px
# generate a chart (xy plot) with  defaults changed for X/Y Axis labels, linetype
plot(household$Date_time,household$Global_active_power, type="l",xlab="",
     ylab="Global Active Power (Kilowatts)")
dev.off();  # close png file