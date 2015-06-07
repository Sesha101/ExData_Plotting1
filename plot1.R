# plot1.R
# for exploratory analysis course project 1
# generates an output plot plot1.png of size 480 by 480 px
# assume that sqldf was already installed
library(sqldf);
household <- read.csv.sql('household_power_consumption.txt', 
    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
    header=TRUE,sep=";")
png(file = "plot1.png");  # default size is 480x480 px
# generate a chart with main title, xlabel, color
hist(household$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (Kilowatts)");
dev.off();  # close png file