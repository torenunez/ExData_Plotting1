#---------------------------------------------------------------------------------------------------
# Coursera - John Hopkins Bloomberg School of Public Health 
# Exploratory Data Analysis
#---------------------------------------------------------------------------------------------------
# Description:      Course Project 1 - Plot 1
# Student:          Salvador J Nunez
# Created:          2015-08-09
#---------------------------------------------------------------------------------------------------

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
hist(
  power_data$Global_active_power, 
  col = "red", 
  xlab = "Global Active Power (kilowatts)", 
  main = "Gloabl Active Power"
  )

##out to device
dev.copy(png, file = "plot1.png")
dev.off()


