# PLOT 3

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


with(pc1,plot(Sub_metering_1
              ,typ="l"
              ,xaxt = "n"
              ,ylab="Energy Sub Metering"
)
)
with(pc1,lines(Sub_metering_2
               ,col="red"
)
)
with(pc1,lines(Sub_metering_3
               ,col="blue"
)
)
axis(side = 1, at = c(1,1440,2880), labels = c("Thu","Fri","Sat"))
legend(1500,40
       ,lty=1
       ,col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,bty="n"
)
dev.copy(png,file="plot3.png")
dev.off()
