## The Third Plot - Energy Sub Metering
library("data.table")

## We already have the file downloaded from the first plot program, but the 
## following code can be used if it is not downloaded 
##zipfileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_
##power_consumption.zip?accessType=DOWNLOAD"
##download.file (zipfileURL, destfile="Household Power Consumption.zip", mode = "wb", 
##               method="auto")
##unzip ("Household Power Consumption.zip")

## Read the data file   
House_Power_Consumption <- fread('household_power_consumption.txt', 
                                 na.strings="?", stringsAsFactors = FALSE)

## Take out only the data for which we need to plot the graph
MyData <- subset (House_Power_Consumption, House_Power_Consumption$Date==
                          "1/2/2007" | Date=="2/2/2007")

## Find the days of the week corresponding to these dates
MyData$Date <- as.Date(MyData$Date, format="%d/%m/%Y")
DateTime <- paste(as.Date(MyData$Date), MyData$Time)
MyData$DateTime <- as.POSIXct(DateTime)

## Open the PNG file
png("plot3.png", width=480, height=480)

## Plot the data
with(MyData, {
        plot(Sub_metering_1~DateTime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the PNG file
dev.off()
