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

# Making the Plot # 2
plot(data_Subset$Global_active_power~data_Subset$dateTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="Plot2.png", height=480, width=480) #Saving the plot into a PNG file
dev.off()
