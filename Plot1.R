library(dplyr)
library(plyr)
# Reading the downloaded data file and creating a temporary data frame
data_temp<-read.csv(file= "./household_power_consumption.txt", sep = ";", na.strings = "?",
                    stringsAsFactors = F, check.names = F, comment.char = "")

# Checking Structure of data frame and viewing Top and bottom few lines) 
str(data_temp)
head(data_temp)
tail(data_temp)

#Converting the date column to proper Date Form
data_temp$Date<-as.Date(data_temp$Date, format="%d/%m/%Y")

rm(data_temp) # Removing original data frame from emory

#Subsetting the Data Frame (between 2007 Feb 01 and 02)
data_Subset<- subset(data_temp,   subset = (Date>="2007-02-01" & Date<= "2007-02-02") )


# Making the First Plot

hist(data_Subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency" )

dev.copy(png, file="Plot1.png", height=480, width=480) #Saving the plot into a PNG file
dev.off()
