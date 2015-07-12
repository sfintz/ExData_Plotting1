# PLOT 1

# Download and unzip data
if(!file.exists("data")) {  dir.create("data") }
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./powerconsum.zip")
unzip("./powerconsum.zip",exdir="./data")

if (!require("sqldf")) {
  install.packages("sqldf")
}
library(sqldf)

pc1<-read.csv.sql("./data/household_power_consumption.txt",sql = "select * from file where Date in ('1/2/2007','2/2/2007')",sep=";",header=TRUE)

if (!require("datasets")) {
  install.packages("datasets")
}
library(datasets)


hist(pc1$Global_active_power
     ,col="red"
     ,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)"
)
dev.copy(png,file="plot1.png")
dev.off()
