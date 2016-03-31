library(dplyr)
library(plyr)
# Reading the downloaded data file and creating a temporary data frame
data_temp<-read.csv(file= "./household_power_consumption.txt", sep = ";", na.strings = "?",
                    stringsAsFactors = F, check.names = F, comment.char = "", quote = "\"")


# Checking Structure of data frame and viewing Top and bottom few lines) 
str(data_temp)
head(data_temp)
tail(data_temp)

#Converting the date column to proper Date Form
data_temp$Date<-as.Date(data_temp$Date, format="%d/%m/%Y")

rm(data_temp) # Removing original data frame from emory

#Subsetting the Data Frame (between 2007 Feb 01 and 02)
data_Subset<- subset(data_temp,   subset = (Date>="2007-02-01" & Date<= "2007-02-02") )

#Converting date and Time
dt_time<- paste(as.Date(data_Subset$Date), data_Subset$Time)
data_Subset$dateTime<-as.POSIXct(dt_time)

# Making the Plot # 3
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) # setting plot windws and margin

with(data_Subset, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


dev.copy(png, file="Plot4.png", height=480, width=540) #Saving the plot into a PNG file
dev.off()