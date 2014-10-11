#setwd("C://DISCO_D//ORGANIZADO//Coursera//__Coursera//08_Data Science Specialization//04_Exploratory Data Analysis//Project_1")

## Get Data


fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "Electric_Power_Consumption.zip")
unzip("Electric_Power_Consumption.zip")


### Load Data

HPC = read.table("household_power_consumption.txt", sep=";", header=TRUE , na.strings="?")

data = HPC[HPC$Date == "1/2/2007" |  HPC$Date == "2/2/2007",]

data$date_time = paste(data$Date, data$Time)
data$date_time = strptime(data$date_time, "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")


png("plot2.png", width = 480, height = 480)

plot(data$date_time, data$Global_active_power, type="n", 
                                               ylab= "Global Active Power (kilowatts)",
                                               xlab="")
lines(data$date_time, data$Global_active_power)


dev.off()
