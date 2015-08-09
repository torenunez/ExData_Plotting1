#---------------------------------------------------------------------------------------------------
# Coursera - John Hopkins Bloomberg School of Public Health 
# Exploratory Data Analysis
#---------------------------------------------------------------------------------------------------
# Description:      Course Project 1 - Plot 4
# Student:          Salvador J Nunez
# Created:          2015-08-09
#---------------------------------------------------------------------------------------------------

##---------------------------------------------------------------------------
## Setup
##---------------------------------------------------------------------------
library(lubridate)

##---------------------------------------------------------------------------
## Load Data
##---------------------------------------------------------------------------
all_power_data <- read.table(
                            file = "household_power_consumption.txt", 
                            header = TRUE, 
                            sep = ";",
                            )

##---------------------------------------------------------------------------
## Clean Data
##---------------------------------------------------------------------------
power_data <- all_power_data[all_power_data$Date %in% c("1/2/2007","2/2/2007"),]
power_data[power_data=="?"] <- NA
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
power_data$Time <- ymd_hms(paste(as.character(power_data$Date),as.character(power_data$Time)))
cols <- seq(3,9)    
power_data[,cols] <- apply(power_data[,cols], 2, function(x) as.numeric(x))


##---------------------------------------------------------------------------
## Plot Data
##---------------------------------------------------------------------------
##set multi plot row parameters
par(mfrow = c(2,2), mar = c(4.5,4.5,1,1))

##plot 4-1
with(power_data, plot(Time, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power"))

##plot 4-2
with(power_data, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

##plot 4-3
with(power_data, plot(Time, Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering"))
with(power_data, lines(Time, Sub_metering_1, col = "black"))
with(power_data, lines(Time, Sub_metering_2, col = "red"))
with(power_data, lines(Time, Sub_metering_3, col = "blue"))
legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, cex = 0.5)

##plot 4-4
with(power_data, plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

##out to device
dev.copy(png, file = "plot4.png")
dev.off()

