## The first Plot - for Global Active Power
library("data.table")

## Download and unzip the data set
zipfileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_
power_consumption.zip?accessType=DOWNLOAD"
download.file (zipfileURL, destfile="Household Power Consumption.zip", 
               mode = "wb", method="auto")
unzip ("Household Power Consumption.zip")

## Read the data file   
House_Power_Consumption <- fread('household_power_consumption.txt', 
                                 na.strings="?", stringsAsFactors = FALSE)

## Take out only the data for which we need to plot the graph
MyData <- subset (House_Power_Consumption, House_Power_Consumption$Date==
                          "1/2/2007" | Date=="2/2/2007")
MyData$Date <- as.Date(MyData$Date, format="%d/%m/%Y")

## Open the PNG file
png("plot1.png", width=480, height=480)

## Plot the data
hist(MyData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Close the PNG file
dev.off()
