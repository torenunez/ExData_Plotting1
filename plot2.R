#---------------------------------------------------------------------------------------------------
# Coursera - John Hopkins Bloomberg School of Public Health 
# Exploratory Data Analysis
#---------------------------------------------------------------------------------------------------
# Description:      Course Project 1 - Plot 2
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
all_power_data = read.table(
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
##reset in case working betweeen plots
par(mfrow = c(1,1))

##plot
with(power_data, plot(Time, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

##out to device
dev.copy(png, file = "plot2.png")
dev.off()
